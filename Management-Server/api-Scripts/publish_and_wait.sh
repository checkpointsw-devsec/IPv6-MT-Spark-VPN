#!/bin/bash
highlight_message() {
    tput bold
    tput setaf 3
    echo "$1"
    tput sgr0
}

highlight_message '########################  publish ##########################'
PUBLISH_RESPONSE=$(mgmt_cli publish -s /home/admin/sid.txt --format json)
TASK_ID=$(echo "$PUBLISH_RESPONSE" | jq -r '.tasks[0]."task-id"')

if [ -z "$TASK_ID" ]; then
    echo "Error: Failed to retrieve task ID."
    exit 1
fi

while true; do
    TASK_RESPONSE=$(mgmt_cli show task task-id "$TASK_ID" -s /home/admin/sid.txt --format json)
    STATUS=$(echo "$TASK_RESPONSE" | jq -r '.tasks[0].status')
	highlight_message "########################  task status: $STATUS #############"
    # echo "Task Status: $STATUS"

    if [ "$STATUS" = "succeeded" ] || [ "$STATUS" = "failed" ]; then
        break
    fi
    sleep 5
done

highlight_message "###############Publish completed with status: $STATUS ######"
highlight_message '########################   logout  ###########################'
mgmt_cli logout -s /home/admin/sid.txt
# rm /home/admin/sid.txt