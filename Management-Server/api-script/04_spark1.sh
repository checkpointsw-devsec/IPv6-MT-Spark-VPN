#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '###################         adding spark1 ##################'
mgmt_cli add simple-gateway -s /home/admin/sid.txt\
        name "vpn-gw-1" \
        color "Red" \
        version "R82" \
        allow-smb true \
        os-name "Gaia Embedded" \
        hardware "1585R Appliances" \
        ipv6-address "2a04:6447:900:100::10" \
		ipv4-address "10.1.0.10" \
        firewall true \
		one-time-password "$otp" \
        trust-settings.initiation-phase 'now' \
        platform-portal-settings.portal-web-settings.main-url "https://[2a04:6447:900:100::10]/" \
        interfaces.1.name "$rugg_vlan100" \
        interfaces.1.ipv6-address "2a04:6447:900:100::10" \
        interfaces.1.ipv6-mask-length "64" \
		interfaces.1.ipv4-address "10.1.0.10" \
		interfaces.1.ipv4-mask-length "24" \
        interfaces.1.topology "EXTERNAL" \
        interfaces.1.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
        interfaces.1.topology-settings.interface-leads-to-dmz false \
        interfaces.1.anti-spoofing true \
        interfaces.1.anti-spoofing-settings.action "prevent" \
        interfaces.2.name "$rugg_vlan101" \
        interfaces.2.ipv6-address "2a04:6447:900:101::10" \
        interfaces.2.ipv6-mask-length "64" \
        interfaces.2.ipv4-address "10.1.1.10" \
		interfaces.2.ipv4-mask-length "24" \
		interfaces.2.topology "External" \
        interfaces.2.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
        interfaces.2.topology-settings.interface-leads-to-dmz false \
        interfaces.2.anti-spoofing true \
        interfaces.2.anti-spoofing-settings.action "prevent" \
        interfaces.3.name "$rugg_vlan102" \
        interfaces.3.ipv6-address "2a04:6447:900:102::10" \
        interfaces.3.ipv6-mask-length "64" \
		interfaces.3.ipv4-address "10.1.2.10" \
		interfaces.3.ipv4-mask-length "24" \
        interfaces.3.topology "External" \
        interfaces.3.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
        interfaces.3.topology-settings.interface-leads-to-dmz false \
        interfaces.3.anti-spoofing true \
        interfaces.3.anti-spoofing-settings.action "prevent" \
        interfaces.4.name "LAN1" \
        interfaces.4.ipv6-address "2a04:6447:900:1100::1" \
        interfaces.4.ipv6-mask-length "64" \
		interfaces.4.ipv4-address "10.11.0.10" \
		interfaces.4.ipv4-mask-length "24" \
        interfaces.4.topology "Internal" \
        interfaces.4.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
        interfaces.4.topology-settings.interface-leads-to-dmz false \
        interfaces.4.anti-spoofing true \
        interfaces.4.anti-spoofing-settings.action "prevent" \
        interfaces.5.name "LAN2" \
        interfaces.5.ipv6-address "2a04:6447:900:1101::1" \
        interfaces.5.ipv6-mask-length "64" \
		interfaces.5.ipv4-address "10.11.1.10" \
		interfaces.5.ipv4-mask-length "24" \
        interfaces.5.topology "Internal" \
        interfaces.5.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
        interfaces.5.topology-settings.interface-leads-to-dmz false \
        interfaces.5.anti-spoofing true \
        interfaces.5.anti-spoofing-settings.action "prevent" \
        interfaces.6.name "LAN3" \
        interfaces.6.ipv6-address "2a04:6447:900:1102::1" \
        interfaces.6.ipv6-mask-length "64" \
		interfaces.6.ipv4-address "10.11.2.10" \
		interfaces.6.ipv4-mask-length "24" \
        interfaces.6.topology "Internal" \
        interfaces.6.topology-settings.ip-address-behind-this-interface "network defined by the interface ip and net mask" \
        interfaces.6.topology-settings.interface-leads-to-dmz false \
        interfaces.6.anti-spoofing true \
        interfaces.6.anti-spoofing-settings.action "prevent" 
        
highlight_message '############### enable vpn blade on spark1       ###########'
mgmt_cli set simple-gateway -s /home/admin/sid.txt\
         name "vpn-gw-1" \
		 allow-smb true \
		 ipv6-address "2a04:6447:900:100::10" \
         vpn true
		 
highlight_message '############### add vpn EHL selection interfaces ###########'
mgmt_cli set-simple-gateway -s /home/admin/sid.txt\
         name "vpn-gw-1" \
		 ipv6-address "2a04:6447:900:100::10" \
		 allow-smb true \
		 vpn-settings.vpn-domain-type "manual" \
		 vpn-settings.vpn-domain "Spark1_EncDom46" \
		 vpn-settings.interfaces.1.interface-name "$rugg_vlan100" \
         vpn-settings.interfaces.1.ip-version "ipv6" \
		 vpn-settings.interfaces.2.interface-name "$rugg_vlan101" \
         vpn-settings.interfaces.2.ip-version "ipv6" \
		 vpn-settings.interfaces.3.interface-name "$rugg_vlan102" \
         vpn-settings.interfaces.3.ip-version "ipv6" \
		 vpn-settings.interfaces.4.interface-name "$rugg_vlan100" \
         vpn-settings.interfaces.4.ip-version "ipv4" \
		 vpn-settings.interfaces.5.interface-name "$rugg_vlan101" \
         vpn-settings.interfaces.5.ip-version "ipv4" \
		 vpn-settings.interfaces.6.interface-name "$rugg_vlan102" \
         vpn-settings.interfaces.6.ip-version "ipv4" 

		 
myUID0=$(mgmt_cli show-generic-objects -s /home/admin/sid.txt name "vpn-gw-1" -f json | jq '.objects[0].uid')
mgmt_cli set-generic-object -s /home/admin/sid.txt uid $myUID0 securityBladesTopologyMode "TOPOLOGY_TABLE" 

myUID1=$(mgmt_cli show-generic-objects -s /home/admin/sid.txt name "vpn-gw-1" -f json | jq '.objects[1].uid')
mgmt_cli set-generic-object -s /home/admin/sid.txt uid $myUID1 securityBladesTopologyMode "TOPOLOGY_TABLE" 

cprid_util -server 2a04:6447:900:100::10 -verbose rexec -rcmd /bin/bash -c "LOGNAME=admin bashUser on"

./publish_and_wait.sh 
