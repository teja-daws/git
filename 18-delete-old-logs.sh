#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#checking SOURCE_DIR is present or not
if [ -d $SOURCE_DIR]
then
    echo -e "$SOURCE_DIR $G Exists $N"
else
    echo -e "$SOURCE_DIR $R does not exist $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files: $FILES"

#dont use line, it is a reservers word
while IFS= read -r file #IFS, internal filed seperator, empty it will ignore while space, -r is for not to ignore special characters like /
do
    echo "Deleting file: $file"
    rm -rf $file
done <<< $FILES