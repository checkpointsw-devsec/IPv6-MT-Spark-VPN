#!/bin/bash
highlight_message() {
    tput bold
    tput setaf 3
    echo "$1"
    tput sgr0
}

# Variables
mgmt_ip=172.23.23.13
otp=zubur1

#Cluster cl1 vars
cl1_main_ipv4=172.23.23.177
cl1_gw1_main_ipv4=172.23.23.175
cl1_gw2_main_ipv4=172.23.23.176
cl1_mgmt=Mgmt
cl1_vlan100=eth1-01.100
cl1_vlan101=eth1-01.101
cl1_vlan102=eth1-01.102
cl1_vlan200=eth1-02.200
cl1_Sync=eth1-03


#Cluster cl2 vars
cl2_main_ipv4=172.23.23.108
cl2_gw1_main_ipv4=172.23.23.106
cl2_gw2_main_ipv4=172.23.23.107
cl2_mgmt=eth5
cl2_vlan300=eth2-01.300
cl2_vlan400=eth2-02.400

# mt-vpn-gw-6 vars
gw6_vlan100=eth1-02.100
gw6_vlan101=eth1-02.101
gw6_vlan102=eth1-02.102
gw6_lanX100=eth1-01

#1595 Rugged vars
# mt-vpn-gw-6 vars
rugg_vlan100=WAN.100
rugg_vlan101=WAN.101
rugg_vlan102=WAN.102
#rugg_lanX100=DMZ
#rugg_lanX102=LAN3
#rugg_lanX101=LAN4

SID_DIR=$(pwd)
MAX_RETRIES=5
RETRY_COUNT=0
LOGIN_SUCCESS=preStage
highlight_message '################              login            ##############'
while [[ $RETRY_COUNT -lt $MAX_RETRIES ]]; do
    
	mgmt_cli login -u "admin" -p "$otp" -m "$mgmt_ip" > /home/admin/sid.txt
	if grep -q "sid" /home/admin/sid.txt; then
        echo "Login successful!"
        export LOGIN_SUCCESS=true
        break
    else
        echo "Login failed. Retrying..."
        ((RETRY_COUNT++))
        sleep 10  # Add a small delay before retrying
    fi
done

if [[ -z "$LOGIN_SUCCESS" ]]; then
    echo "Login failed after $MAX_RETRIES attempts. Exiting..."
    exit 1
fi
