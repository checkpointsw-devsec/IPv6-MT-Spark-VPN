#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '###################         adding fw policy ###############'
mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "cl1_cl2" \
	source.1 "Cl1" \
	source.2 "Cl2" \
	destination.1 "Cl1" \
	destination.2 "Cl2" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "cl1_spark" \
	source.1 "Cl1" \
	source.2 "vpn-gw-1" \
	source.3 "vpn-gw-2" \
	source.4 "vpn-gw-3" \
	source.5 "vpn-gw-4" \
	source.6 "vpn-gw-5" \
	destination.1 "Cl1" \
	destination.2 "vpn-gw-1" \
	destination.3 "vpn-gw-2" \
	destination.4 "vpn-gw-3" \
	destination.5 "vpn-gw-4" \
	destination.6 "vpn-gw-5" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark1_lan1" \
	source.1 "IPv6_2a04:6447:900:1100::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark1_lan2" \
	source.1 "IPv6_2a04:6447:900:1101::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark1_lan3" \
	source.1 "IPv6_2a04:6447:900:1102::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"


mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark2_lan1" \
	source.1 "IPv6_2a04:6447:900:2100::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark2_lan2" \
	source.1 "IPv6_2a04:6447:900:2101::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark2_lan3" \
	source.1 "IPv6_2a04:6447:900:2102::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark3_lan1" \
	source.1 "IPv6_2a04:6447:900:3100::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark3_lan2" \
	source.1 "IPv6_2a04:6447:900:3101::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark3_lan3" \
	source.1 "IPv6_2a04:6447:900:3102::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark4_lan1" \
	source.1 "IPv6_2a04:6447:900:4100::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark4_lan2" \
	source.1 "IPv6_2a04:6447:900:4101::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark4_lan3" \
	source.1 "IPv6_2a04:6447:900:4102::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark5_lan1" \
	source.1 "IPv6_2a04:6447:900:5100::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark5_lan2" \
	source.1 "IPv6_2a04:6447:900:5101::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "spark5_lan3" \
	source.1 "IPv6_2a04:6447:900:5102::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "vlan100 network" \
	source.1 "IPv6_2a04:6447:900:100::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "vlan200 network" \
	source.1 "IPv6_2a04:6447:900:200::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "vlan400 network" \
	source.1 "IPv6_2a04:6447:900:400::_64" \
	destination.1 "any" \
	service "any" \
	action "accept" \
	track.type "LOG"

mgmt_cli add access-rule -s /home/admin/sid.txt \
	layer "Network"  \
	position "1" \
	name "bgp traffic" \
	source.1 "any" \
	destination.1 "any" \
	service "bgp" \
	action "accept" \
	track.type "LOG"

./publish_and_wait.sh 