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
          targets.2 "Cl2" 


./publish_and_wait.sh 