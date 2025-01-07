#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 # in real projects, it is usally 75

while IFS= read -r line #IFS, internal field seperator, empty it will ignore while space -r 
do
    USAGE=$(echo $line | grep xfs | awk -F "" '{print $6F}' | cut -d "%" -f1 )
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$PARTITION is more than $DISK_THRESHOLD, current value: $USAGE. Please check"
    fi
done <<< $DISK_USAGE