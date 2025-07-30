#!/bin/bash
source parameter.sh

if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '###################         clusters1 IDS only ###############'

myUID0=$(mgmt_cli show-generic-objects -s /home/admin/sid.txt name "Cl1" -f json | jq '.objects[1].uid')
mgmt_cli set-generic-object -s /home/admin/sid.txt uid $myUID0 threatEngineMode detect_only 

./publish_and_wait.sh 
 