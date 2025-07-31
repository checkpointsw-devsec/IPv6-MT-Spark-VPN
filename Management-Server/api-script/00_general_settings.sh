#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '###################         log implied rules ##############'
mgmt_cli set-global-properties -s /home/admin/sid.txt firewall.log-implied-rules true

highlight_message '###################         allow pinging gateways##########'
mgmt_cli set-global-properties -s /home/admin/sid.txt firewall.accept-icmp-requests true

./publish_and_wait.sh 
