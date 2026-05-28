#!/bin/bash

while IFS= read -r line # IFS Internal field seperator
do
    echo "$line"
done < 02-conversation.sh
