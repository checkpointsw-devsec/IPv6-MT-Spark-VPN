#!/bin/bash

sidfile="/home/admin/sid.txt"

GWNAME="SG1"
CertName="SG1ca2Cert2"
DNString="CN=SG1-root,DC=cp-muclab,DC=de"
CERT_P7B="${GWNAME}_chain.p7b"
CERT_PEM="${GWNAME}_chain.pem"
CERT_PEM_CLEAN="${GWNAME}_leaf.pem"
#CAName ="root_ca"
CAName="AD-CPMUCLAB_ca"

mgmt_cli login -r true domain "Maestro" --format json >${sidfile}

CSR_FILE="${GWNAME}_CSR.txt"
mgmt_cli -s ${sidfile} set simple-gateway name "${GWNAME}" \
     vpn-settings.certificates.add.name "${CertName}" \
     vpn-settings.certificates.add.certificate-authority "${CAName}" \
     vpn-settings.certificates.add.enrollment.enrollment-settings.distinguished-name "${DNString}" \
     vpn-settings.certificates.add.stored-at "management server" --format json  | \
     jq ".\"vpn-settings\".certificates[] | select(.name == \"$CertName\") | .\"base64-certificate\"" 2>&1 | \
     grep -v "parse error" | sed 's/\\r//g; s/\\n/\n/g' > "${CSR_FILE}"

CSR_CONTENT=$(< "${GWNAME}_CSR.txt")

# ##################################################
# send request to MS-CA and get chain back
# ##################################################
if ! klist -s; then
  echo "[*] No Kerberos ticket found, attempting kinit..."
  export KRB5CCNAME=/tmp/krb5cc_$(id -u)
  kinit airani@CP-MUCLAB.DE
fi

response=$(curl_cli -k -X POST "https://AD-W2K19.cp-muclab.de/certsrv/certfnsh.asp" \
    --negotiate -u : -H "Content-Type: application/x-www-form-urlencoded" \
	--data-urlencode "Mode=newreq" --data-urlencode "CertAttrib=CertificateTemplate:WebServer" \
	--data-urlencode "TargetStoreFlags=0" --data-urlencode "SaveCert=yes" \
	--data-urlencode "CertRequest=${CSR_CONTENT}")

REQ_ID=$(echo "$response" | grep -oE 'ReqID=[0-9]+' | head -n1 | sed 's/ReqID=//')
curl_cli --negotiate -u : -k   "https://AD-W2K19.cp-muclab.de/certsrv/certnew.p7b?ReqID=${REQ_ID}&Enc=b64" -o "$CERT_P7B"

cpopenssl pkcs7 -in "${CERT_P7B}" -print_certs -out "${CERT_PEM}"
awk 'BEGIN{found=0} /BEGIN CERT/{found++; if(found==1){print;next}} found==1{print} /END CERT/ && found==1{exit}' "${CERT_PEM}" > "${CERT_PEM_CLEAN}"

CLEAN_CRT=$(awk 'BEGIN {p=0} /BEGIN CERT/{p=1; next} /END CERT/{p=0} p' "${CERT_PEM_CLEAN}" | tr -d '\n')
# ##################################################
# ##################################################


mgmt_cli set-simple-gateway -s "${sidfile}" \
  name "${GWNAME}" vpn-settings.certificates.complete.name "${CertName}" vpn-settings.certificates.complete.base64-certificate "${CLEAN_CRT}"

mgmt_cli publish -s "${sidfile}"
mgmt_cli logout -s "${sidfile}"


