#!/bin/bash
source parameter.sh

if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '###################         adding clusters1 ###############'
mgmt_cli add-simple-cluster -s /home/admin/sid.txt\
         name "Cl1" \
         color "Yellow" \
         version "R82" \
         ipv4-address "$cl1_main_ipv4" \
         ipv6-address "2a04:6447:900:500::13" \
         os-name "Gaia" \
         cluster-mode "cluster-xl-ha" \
         firewall true \
         vpn true \
         ips true \
		 cluster-settings.use-virtual-mac "true" \
		 cluster-settings.member-recovery-mode "according-to-priority" \
		 cluster-settings.state-synchronization.delayed "false" \
         interfaces.1.name "$cl1_vlan100" \
         interfaces.1.ipv4-address "10.1.0.3" \
         interfaces.1.ipv4-mask-length "24" \
         interfaces.1.ipv6-address "2a04:6447:900:100::3" \
         interfaces.1.ipv6-mask-length "64" \
         interfaces.1.interface-type "cluster" \
         interfaces.1.topology "EXTERNAL" \
         interfaces.1.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
         interfaces.1.topology-settings.interface-leads-to-dmz false \
         interfaces.1.anti-spoofing true \
         interfaces.1.anti-spoofing-settings.action "detect" \
         interfaces.2.name "$cl1_vlan200" \
         interfaces.2.ipv4-address "10.2.0.3" \
         interfaces.2.ipv4-mask-length "24" \
         interfaces.2.ipv6-address "2a04:6447:900:200::3" \
         interfaces.2.ipv6-mask-length "64" \
         interfaces.2.interface-type "cluster" \
         interfaces.2.topology "EXTERNAL" \
         interfaces.2.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
         interfaces.2.topology-settings.interface-leads-to-dmz false \
         interfaces.2.anti-spoofing true \
         interfaces.2.anti-spoofing-settings.action "detect" \
         interfaces.3.name "$cl1_vlan101" \
         interfaces.3.ipv4-address "10.1.1.3" \
         interfaces.3.ipv4-mask-length "24" \
         interfaces.3.ipv6-address "2a04:6447:900:101::3" \
         interfaces.3.ipv6-mask-length "64" \
         interfaces.3.interface-type "cluster" \
         interfaces.3.topology "EXTERNAL" \
         interfaces.3.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
         interfaces.3.topology-settings.interface-leads-to-dmz false \
         interfaces.3.anti-spoofing true \
         interfaces.3.anti-spoofing-settings.action "detect" \
         interfaces.4.name "$cl1_vlan102" \
         interfaces.4.ipv4-address "10.1.2.3" \
         interfaces.4.ipv4-mask-length "24" \
         interfaces.4.ipv6-address "2a04:6447:900:102::3" \
         interfaces.4.ipv6-mask-length "64" \
         interfaces.4.interface-type "cluster" \
         interfaces.4.topology "EXTERNAL" \
         interfaces.4.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
         interfaces.4.topology-settings.interface-leads-to-dmz false \
         interfaces.4.anti-spoofing true \
         interfaces.4.anti-spoofing-settings.action "detect" \
         interfaces.5.name "$cl1_mgmt" \
         interfaces.5.ipv4-address "$cl1_main_ipv4" \
         interfaces.5.ipv4-mask-length "24" \
         interfaces.5.ipv6-address "2a04:6447:900:500::13" \
         interfaces.5.ipv6-mask-length "64" \
         interfaces.5.interface-type "cluster" \
         interfaces.5.topology "Internal" \
         interfaces.5.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
         interfaces.5.topology-settings.interface-leads-to-dmz false \
         interfaces.5.anti-spoofing true \
         interfaces.5.anti-spoofing-settings.action "detect" \
         interfaces.6.name "$cl1_Sync" \
         interfaces.6.interface-type "sync" \
         interfaces.6.topology "Internal" \
         interfaces.6.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
		 interfaces.6.topology-settings.interface-leads-to-dmz false \
		 interfaces.6.anti-spoofing true \
         interfaces.6.anti-spoofing-settings.action "detect" \
		 members.1.name "cl1-gw1" \
         members.1.ipv4-address "$cl1_gw1_main_ipv4" \
         members.1.ipv6-address "2a04:6447:900:500::11" \
         members.1.one-time-password "$otp" \
         members.1.interfaces.1.name "$cl1_vlan100" \
         members.1.interfaces.1.ipv4-address "10.1.0.1" \
         members.1.interfaces.1.ipv4-mask-length "24" \
         members.1.interfaces.1.ipv6-address "2a04:6447:900:100::1" \
         members.1.interfaces.1.ipv6-mask-length "64" \
         members.1.interfaces.2.name "$cl1_vlan200" \
         members.1.interfaces.2.ipv4-address "10.2.0.1" \
         members.1.interfaces.2.ipv4-mask-length "24" \
         members.1.interfaces.2.ipv6-address "2a04:6447:900:200::1" \
         members.1.interfaces.2.ipv6-mask-length "64" \
         members.1.interfaces.3.name "$cl1_vlan101" \
         members.1.interfaces.3.ipv4-address "10.1.1.1" \
         members.1.interfaces.3.ipv4-mask-length "24" \
         members.1.interfaces.3.ipv6-address "2a04:6447:900:101::1" \
         members.1.interfaces.3.ipv6-mask-length "64" \
         members.1.interfaces.4.name "$cl1_vlan102" \
         members.1.interfaces.4.ipv4-address "10.1.2.1" \
         members.1.interfaces.4.ipv4-mask-length "24" \
         members.1.interfaces.4.ipv6-address "2a04:6447:900:102::1" \
         members.1.interfaces.4.ipv6-mask-length "64" \
         members.1.interfaces.5.name "$cl1_mgmt" \
         members.1.interfaces.5.ipv4-address "$cl1_gw1_main_ipv4" \
         members.1.interfaces.5.ipv4-mask-length "24" \
         members.1.interfaces.5.ipv6-address "2a04:6447:900:500::11" \
         members.1.interfaces.5.ipv6-mask-length "64" \
         members.1.interfaces.6.name "$cl1_Sync" \
         members.1.interfaces.6.ipv4-address "192.168.20.1" \
         members.1.interfaces.6.ipv4-mask-length "24" \
         members.2.name "cl1-gw2" \
         members.2.ipv4-address "$cl1_gw2_main_ipv4" \
         members.2.ipv6-address "2a04:6447:900:500::12" \
         members.2.one-time-password "$otp" \
         members.2.interfaces.1.name "$cl1_vlan100" \
         members.2.interfaces.1.ipv4-address "10.1.0.2" \
         members.2.interfaces.1.ipv4-mask-length "24" \
         members.2.interfaces.1.ipv6-address "2a04:6447:900:100::2" \
         members.2.interfaces.1.ipv6-mask-length "64" \
         members.2.interfaces.2.name "$cl1_vlan200" \
         members.2.interfaces.2.ipv4-address "10.2.0.2" \
         members.2.interfaces.2.ipv4-mask-length "24" \
         members.2.interfaces.2.ipv6-address "2a04:6447:900:200::2" \
         members.2.interfaces.2.ipv6-mask-length "64" \
         members.2.interfaces.3.name "$cl1_vlan101" \
         members.2.interfaces.3.ipv4-address "10.1.1.2" \
         members.2.interfaces.3.ipv4-mask-length "24" \
         members.2.interfaces.3.ipv6-address "2a04:6447:900:101::2" \
         members.2.interfaces.3.ipv6-mask-length "64" \
         members.2.interfaces.4.name "$cl1_vlan102" \
         members.2.interfaces.4.ipv4-address "10.1.2.2" \
         members.2.interfaces.4.ipv4-mask-length "24" \
         members.2.interfaces.4.ipv6-address "2a04:6447:900:102::2" \
         members.2.interfaces.4.ipv6-mask-length "64" \
         members.2.interfaces.5.name "$cl1_mgmt" \
         members.2.interfaces.5.ipv4-address "$cl1_gw2_main_ipv4" \
         members.2.interfaces.5.ipv4-mask-length "24" \
         members.2.interfaces.5.ipv6-address "2a04:6447:900:500::12" \
         members.2.interfaces.5.ipv6-mask-length "64" \
		 members.2.interfaces.6.name "$cl1_Sync" \
         members.2.interfaces.6.ipv4-address "192.168.20.2" \
         members.2.interfaces.6.ipv4-mask-length "24" 
         

highlight_message '############### add vpn EHL selection interfaces ###########'
mgmt_cli set-simple-cluster -s /home/admin/sid.txt\
         name "Cl1" \
         vpn-settings.vpn-domain-exclude-external-ip-addresses "false" \
		 vpn-settings.interfaces.1.interface-name "eth1-01.100" \
         vpn-settings.interfaces.1.ip-version "ipv6" \
		 vpn-settings.interfaces.2.interface-name "eth1-01.101" \
         vpn-settings.interfaces.2.ip-version "ipv6" \
		 vpn-settings.interfaces.3.interface-name "eth1-01.102" \
         vpn-settings.interfaces.3.ip-version "ipv6" \
		 vpn-settings.interfaces.4.interface-name "eth1-02.200" \
         vpn-settings.interfaces.4.ip-version "ipv6" \
		 vpn-settings.interfaces.5.interface-name "eth1-01.100" \
         vpn-settings.interfaces.5.ip-version "ipv4" \
		 vpn-settings.interfaces.6.interface-name "eth1-01.101" \
         vpn-settings.interfaces.6.ip-version "ipv4" \
		 vpn-settings.interfaces.7.interface-name "eth1-01.102" \
         vpn-settings.interfaces.7.ip-version "ipv4" \
		 vpn-settings.interfaces.8.interface-name "eth1-02.200" \
         vpn-settings.interfaces.8.ip-version "ipv4" 

./publish_and_wait.sh 
