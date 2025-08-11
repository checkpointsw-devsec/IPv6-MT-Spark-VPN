#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '###################         adding cl1_cl2 community #######'
mgmt_cli add vpn-community-star -s /home/admin/sid.txt \
    name "cl1_cl2_community" \
    encryption-method "ikev2 only" \
    encryption-suite "custom" \
    ike-phase-1.data-integrity "sha256" \
    ike-phase-1.encryption-algorithm "aes-256" \
    ike-phase-1.diffie-hellman-group "group-20" \
    ike-phase-2.data-integrity "sha256" \
    ike-phase-2.encryption-algorithm "aes-256" \
    ike-phase-2.ike-p2-use-pfs "true" \
    ike-phase-2.ike-p2-pfs-dh-grp "group-20" \
    link-selection-mode "enhanced" \
    tunnel-granularity "per_host" \
    center-gateways "cl1" \
    override-vpn-domains.1.gateway "cl1" \
    override-vpn-domains.1.vpn-domain "Cl1_to_cl2_EncDom46" \
    override-interfaces.1.gateway "cl1" \
    override-interfaces.1.interfaces.1.ip-version "ipv6" \
    override-interfaces.1.interfaces.1.interface-name "$cl1_vlan200" \
    override-interfaces.1.interfaces.2.ip-version "ipv4" \
    override-interfaces.1.interfaces.2.interface-name "$cl1_vlan200" \
    satellite-gateways.1 "cl2" \
    override-vpn-domains.2.gateway "cl2" \
	override-vpn-domains.2.vpn-domain "Cl2_EncDom46" 
	
myUID=$(mgmt_cli show-generic-objects -s /home/admin/sid.txt name "cl1_cl2_community" -f json | jq '.objects[].uid')

mgmt_cli set-generic-object -s /home/admin/sid.txt \
	uid $myUID \
	routeThroughCenter "TO_OTHER_SATELLITE" \
	allowAllEncryptedTrafficOn "BOTH" 	\
	permanentTunnelsDef "COMMUNITY_LEVEL"
	
./publish_and_wait.sh 