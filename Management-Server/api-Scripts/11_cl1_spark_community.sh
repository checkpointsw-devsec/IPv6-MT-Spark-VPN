#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '#################         adding cl1_spark community #######'
mgmt_cli add vpn-community-star -s /home/admin/sid.txt \
	name "cl1_spark_community" \
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
	tunnel-granularity "per_subnet" \
	center-gateways "cl1" \
	override-vpn-domains.1.gateway "cl1" \
	override-vpn-domains.1.vpn-domain "Cl1_EncDom46" \
	override-interfaces.1.gateway "cl1" \
	override-interfaces.1.interfaces.1.ip-version "ipv6" \
	override-interfaces.1.interfaces.1.interface-name "$cl1_vlan100" \
	override-interfaces.1.interfaces.2.ip-version "ipv6" \
	override-interfaces.1.interfaces.2.interface-name "$cl1_vlan101" \
	override-interfaces.1.interfaces.3.ip-version "ipv6" \
	override-interfaces.1.interfaces.3.interface-name "$cl1_vlan102" \
	override-interfaces.1.interfaces.4.ip-version "ipv4" \
	override-interfaces.1.interfaces.4.interface-name "$cl1_vlan100" \
	override-interfaces.1.interfaces.5.ip-version "ipv4" \
	override-interfaces.1.interfaces.5.interface-name "$cl1_vlan101" \
	override-interfaces.1.interfaces.6.ip-version "ipv4" \
	override-interfaces.1.interfaces.6.interface-name "$cl1_vlan102" \
	satellite-gateways.1 "vpn-gw-1" \
	satellite-gateways.2 "vpn-gw-2" \
	satellite-gateways.3 "vpn-gw-3" \
	satellite-gateways.4 "vpn-gw-4" \
	satellite-gateways.5 "vpn-gw-5" \
	override-interfaces.2.gateway "vpn-gw-1" \
	override-interfaces.2.interfaces.1.ip-version "ipv6" \
	override-interfaces.2.interfaces.1.interface-name "$rugg_vlan100" \
	override-interfaces.2.interfaces.2.ip-version "ipv6" \
	override-interfaces.2.interfaces.2.interface-name "$rugg_vlan101" \
	override-interfaces.2.interfaces.3.ip-version "ipv6" \
	override-interfaces.2.interfaces.3.interface-name "$rugg_vlan102" \
	override-interfaces.2.interfaces.4.ip-version "ipv4" \
	override-interfaces.2.interfaces.4.interface-name "$rugg_vlan100" \
	override-interfaces.2.interfaces.5.ip-version "ipv4" \
	override-interfaces.2.interfaces.5.interface-name "$rugg_vlan101" \
	override-interfaces.2.interfaces.6.ip-version "ipv4" \
	override-interfaces.2.interfaces.6.interface-name "$rugg_vlan102" \
	override-vpn-domains.2.gateway "vpn-gw-1" \
	override-vpn-domains.2.vpn-domain "Spark1_EncDom46"\
	override-interfaces.3.gateway "vpn-gw-2" \
	override-interfaces.3.interfaces.1.ip-version "ipv6" \
	override-interfaces.3.interfaces.1.interface-name "$rugg_vlan100" \
	override-interfaces.3.interfaces.2.ip-version "ipv6" \
	override-interfaces.3.interfaces.2.interface-name "$rugg_vlan101" \
	override-interfaces.3.interfaces.3.ip-version "ipv6" \
	override-interfaces.3.interfaces.3.interface-name "$rugg_vlan102" \
	override-interfaces.3.interfaces.4.ip-version "ipv4" \
	override-interfaces.3.interfaces.4.interface-name "$rugg_vlan100" \
	override-interfaces.3.interfaces.5.ip-version "ipv4" \
	override-interfaces.3.interfaces.5.interface-name "$rugg_vlan101" \
	override-interfaces.3.interfaces.6.ip-version "ipv4" \
	override-interfaces.3.interfaces.6.interface-name "$rugg_vlan102" \
	override-vpn-domains.3.gateway "vpn-gw-2" \
	override-vpn-domains.3.vpn-domain "Spark2_EncDom46"\
	override-interfaces.4.gateway "vpn-gw-3" \
	override-interfaces.4.interfaces.1.ip-version "ipv6" \
	override-interfaces.4.interfaces.1.interface-name "$rugg_vlan100" \
	override-interfaces.4.interfaces.2.ip-version "ipv6" \
	override-interfaces.4.interfaces.2.interface-name "$rugg_vlan101" \
	override-interfaces.4.interfaces.3.ip-version "ipv6" \
	override-interfaces.4.interfaces.3.interface-name "$rugg_vlan102" \
	override-interfaces.4.interfaces.4.ip-version "ipv4" \
	override-interfaces.4.interfaces.4.interface-name "$rugg_vlan100" \
	override-interfaces.4.interfaces.5.ip-version "ipv4" \
	override-interfaces.4.interfaces.5.interface-name "$rugg_vlan101" \
	override-interfaces.4.interfaces.6.ip-version "ipv4" \
	override-interfaces.4.interfaces.6.interface-name "$rugg_vlan102" \
	override-vpn-domains.4.gateway "vpn-gw-3" \
	override-vpn-domains.4.vpn-domain "Spark3_EncDom46"\
	override-interfaces.5.gateway "vpn-gw-4" \
	override-interfaces.5.interfaces.1.ip-version "ipv6" \
	override-interfaces.5.interfaces.1.interface-name "$rugg_vlan100" \
	override-interfaces.5.interfaces.2.ip-version "ipv6" \
	override-interfaces.5.interfaces.2.interface-name "$rugg_vlan101" \
	override-interfaces.5.interfaces.3.ip-version "ipv6" \
	override-interfaces.5.interfaces.3.interface-name "$rugg_vlan102" \
	override-interfaces.5.interfaces.4.ip-version "ipv4" \
	override-interfaces.5.interfaces.4.interface-name "$rugg_vlan100" \
	override-interfaces.5.interfaces.5.ip-version "ipv4" \
	override-interfaces.5.interfaces.5.interface-name "$rugg_vlan101" \
	override-interfaces.5.interfaces.6.ip-version "ipv4" \
	override-interfaces.5.interfaces.6.interface-name "$rugg_vlan102" \
	override-vpn-domains.5.gateway "vpn-gw-4" \
	override-vpn-domains.5.vpn-domain "Spark4_EncDom46"\
	override-interfaces.6.gateway "vpn-gw-5" \
	override-interfaces.6.interfaces.1.ip-version "ipv6" \
	override-interfaces.6.interfaces.1.interface-name "$rugg_vlan100" \
	override-interfaces.6.interfaces.2.ip-version "ipv6" \
	override-interfaces.6.interfaces.2.interface-name "$rugg_vlan101" \
	override-interfaces.6.interfaces.3.ip-version "ipv6" \
	override-interfaces.6.interfaces.3.interface-name "$rugg_vlan102" \
	override-interfaces.6.interfaces.4.ip-version "ipv4" \
	override-interfaces.6.interfaces.4.interface-name "$rugg_vlan100" \
	override-interfaces.6.interfaces.5.ip-version "ipv4" \
	override-interfaces.6.interfaces.5.interface-name "$rugg_vlan101" \
	override-interfaces.6.interfaces.6.ip-version "ipv4" \
	override-interfaces.6.interfaces.6.interface-name "$rugg_vlan102" \
	override-vpn-domains.6.gateway "vpn-gw-5" \
	override-vpn-domains.6.vpn-domain "Spark5_EncDom46"

myUID=$(mgmt_cli show-generic-objects -s /home/admin/sid.txt name "cl1_spark_community" -f json | jq '.objects[].uid')

mgmt_cli set-generic-object -s /home/admin/sid.txt \
	uid $myUID \
	routeThroughCenter "TO_OTHER_SATELLITE" \
	allowAllEncryptedTrafficOn "BOTH" 	\
	permanentTunnelsDef "COMMUNITY_LEVEL"
	
./publish_and_wait.sh 