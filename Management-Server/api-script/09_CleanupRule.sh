#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '###################         adding fw policy ###############'
mgmt_cli set-access-rule -s /home/admin/sid.txt \
                 layer "Network" \
				 name "Cleanup rule" \
				 action "accept" \
				 track.type "LOG"

./publish_and_wait.sh 