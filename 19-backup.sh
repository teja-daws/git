#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if #3 is empty, default is 14 days

USAGE(){
    echo -e "$R USAGE:: $N sh 19-backup.sh <source> <destination> <days(optional)>"
}
#check the source and destionation are provided

if [ $# -lt 2 ]
then
    USAGE
fi