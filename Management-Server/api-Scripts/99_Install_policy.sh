#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '###################         install policy on all gw #######'
mgmt_cli install-policy -s /home/admin/sid.txt \
          policy-package "standard" \
          access true \
          threat-prevention false \
          targets.1 "Cl1" \
          targets.2 "Cl2" \
          targets.3 "vpn-gw-1" \
          targets.4 "vpn-gw-2" \
          targets.5 "vpn-gw-3" \
          targets.6 "vpn-gw-4" \
          targets.7 "vpn-gw-5" 


./publish_and_wait.sh 