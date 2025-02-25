#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if #3 is empty, default is 14 days
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo -e "$R USAGE:: $N sh 19-backup.sh <source> <destination> <days(optional)>"
}
#check the source and destionation are provided

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exist... Please check"
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exist... Please check"
fi

FILES=$(find ${SOURCE_DIR} -name ".log" -mtime +14)

echo "Files: $FILES"

if [ ! -z $FILES ] #true if files is empty, ! makes expressiom fase
then
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name ".log" -mtime +14 | zip "$ZIP_FILE" -@

    #check if zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Sucessfully zipped files older than $DAYS"
        #remove the files after zipping
        while IFS= read -r file #IFS, internal filed seperator, empty it will ignore while space, -r is for not to ignore special characters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping the files is failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi