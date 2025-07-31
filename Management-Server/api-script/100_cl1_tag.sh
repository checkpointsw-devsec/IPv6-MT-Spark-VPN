#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi


highlight_message '###################         adding taggs example ###########'
mgmt_cli set-simple-cluster -s /home/admin/sid.txt\
         name "Cl1" \
		 tags.add "funk1"

mgmt_cli set-simple-cluster -s /home/admin/sid.txt\
         name "Cl1" \
		 tags.add "funk2"

mgmt_cli set-simple-gateway -s /home/admin/sid.txt\
         name "vpn-gw-1" \
		 allow-smb true \
         ipv6-address "2a04:6447:900:100::10" \
		 tags.add "funk2"

mgmt_cli set-simple-gateway -s /home/admin/sid.txt\
         name "vpn-gw-2" \
		 allow-smb true \
         ipv6-address "2a04:6447:900:100::20" \
		 tags.add "funk2"

mgmt_cli set-simple-gateway -s /home/admin/sid.txt\
         name "vpn-gw-3" \
		 allow-smb true \
         ipv6-address "2a04:6447:900:100::30" \
		 tags.add "funk1"
		 

./publish_and_wait.sh 