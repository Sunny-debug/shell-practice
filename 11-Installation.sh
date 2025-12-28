#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please Get Admin Access"
    exit 1 # Other than 0 means failure
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR :: Installing MySQL is Failed"
    exit 1
else
    echo "Installing MySQL is SUCCESS"
fi        