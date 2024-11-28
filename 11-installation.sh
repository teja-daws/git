#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root priveleges"
    exit 1
fi

dnf list installed gitttttt

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it."
    dnf install gitttttt -y
    if [ $? -ne 0 ]
        echo "Git installation is not sucess.. Please check the error"
        exit 1
    else
        echo "Git installation is sucess..."
    fi
else
    echo "Git is already install noting to do..."
fi