#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '###################         adding clusters2 ###############'
mgmt_cli add-simple-cluster -s /home/admin/sid.txt\
         name "Cl2" \
         color "Blue" \
         version "R82" \
         ipv4-address "$cl2_main_ipv4" \
         ipv6-address "2a04:6447:900:500::23" \
         os-name "Gaia" \
         cluster-mode "cluster-xl-ha" \
         firewall true \
         vpn true \
		 cluster-settings.use-virtual-mac "true" \
		 cluster-settings.member-recovery-mode "according-to-priority" \
		 cluster-settings.state-synchronization.delayed "false" \
         interfaces.1.name "$cl2_vlan300" \
         interfaces.1.ipv4-address "10.3.0.3" \
         interfaces.1.ipv4-mask-length "24" \
         interfaces.1.ipv6-address "2a04:6447:900:300::3" \
         interfaces.1.ipv6-mask-length "64" \
         interfaces.1.interface-type "cluster" \
         interfaces.1.topology "EXTERNAL" \
         interfaces.1.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
         interfaces.1.topology-settings.interface-leads-to-dmz false \
         interfaces.1.anti-spoofing true \
         interfaces.1.anti-spoofing-settings.action "detect" \
         interfaces.2.name "$cl2_vlan400" \
         interfaces.2.ipv4-address "10.4.0.3" \
         interfaces.2.ipv4-mask-length "24" \
         interfaces.2.ipv6-address "2a04:6447:900:400::3" \
         interfaces.2.ipv6-mask-length "64" \
         interfaces.2.interface-type "cluster" \
         interfaces.2.topology "Internal" \
         interfaces.2.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
         interfaces.2.topology-settings.interface-leads-to-dmz false \
         interfaces.2.anti-spoofing true \
         interfaces.2.anti-spoofing-settings.action "detect" \
         interfaces.3.name "$cl2_mgmt" \
         interfaces.3.ipv4-address "$cl2_main_ipv4" \
         interfaces.3.ipv4-mask-length "24" \
         interfaces.3.ipv6-address "2a04:6447:900:500::23" \
         interfaces.3.ipv6-mask-length "64" \
         interfaces.3.interface-type "cluster + sync" \
         interfaces.3.topology "Internal" \
         interfaces.3.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
         interfaces.3.topology-settings.interface-leads-to-dmz false \
         interfaces.3.anti-spoofing true \
         interfaces.3.anti-spoofing-settings.action "detect" \
         members.1.name "cl2-gw1" \
         members.1.ipv4-address "$cl2_gw1_main_ipv4" \
         members.1.ipv6-address "2a04:6447:900:500::21" \
         members.1.one-time-password "$otp" \
         members.1.interfaces.1.name "$cl2_vlan300" \
         members.1.interfaces.1.ipv4-address "10.3.0.1" \
         members.1.interfaces.1.ipv4-mask-length "24" \
         members.1.interfaces.1.ipv6-address "2a04:6447:900:300::1" \
         members.1.interfaces.1.ipv6-mask-length "64" \
         members.1.interfaces.2.name "$cl2_vlan400" \
         members.1.interfaces.2.ipv4-address "10.4.0.1" \
         members.1.interfaces.2.ipv4-mask-length "24" \
         members.1.interfaces.2.ipv6-address "2a04:6447:900:400::1" \
         members.1.interfaces.2.ipv6-mask-length "64" \
         members.1.interfaces.3.name "$cl2_mgmt" \
         members.1.interfaces.3.ipv4-address "$cl2_gw1_main_ipv4" \
         members.1.interfaces.3.ipv4-mask-length "24" \
         members.1.interfaces.3.ipv6-address "2a04:6447:900:500::21" \
         members.1.interfaces.3.ipv6-mask-length "64" \
         members.2.name "cl2-gw2" \
         members.2.ipv4-address "$cl2_gw2_main_ipv4" \
         members.2.ipv6-address "2a04:6447:900:500::22" \
         members.2.one-time-password "$otp" \
         members.2.interfaces.1.name "$cl2_vlan300" \
         members.2.interfaces.1.ipv4-address "10.3.0.2" \
         members.2.interfaces.1.ipv4-mask-length "24" \
         members.2.interfaces.1.ipv6-address "2a04:6447:900:300::2" \
         members.2.interfaces.1.ipv6-mask-length "64" \
         members.2.interfaces.2.name "$cl2_vlan400" \
         members.2.interfaces.2.ipv4-address "10.4.0.2" \
         members.2.interfaces.2.ipv4-mask-length "24" \
         members.2.interfaces.2.ipv6-address "2a04:6447:900:400::2" \
         members.2.interfaces.2.ipv6-mask-length "64" \
         members.2.interfaces.3.name "$cl2_mgmt" \
         members.2.interfaces.3.ipv4-address "$cl2_gw2_main_ipv4" \
         members.2.interfaces.3.ipv4-mask-length "24" \
         members.2.interfaces.3.ipv6-address "2a04:6447:900:500::22" \
         members.2.interfaces.3.ipv6-mask-length "64" 
		 
highlight_message '############### add vpn EHL selection interfaces ###########'
mgmt_cli set-simple-cluster -s /home/admin/sid.txt\
         name "Cl2" \
         vpn-settings.vpn-domain-exclude-external-ip-addresses "false" \
		 vpn-settings.interfaces.1.interface-name "$cl2_vlan300" \
         vpn-settings.interfaces.1.ip-version "ipv6" \
		 vpn-settings.interfaces.2.interface-name "$cl2_vlan300" \
         vpn-settings.interfaces.2.ip-version "ipv4" 

./publish_and_wait.sh 