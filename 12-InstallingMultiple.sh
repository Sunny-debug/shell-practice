#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please Get Admin Access"
    exit 1 # Other than 0 means failure
fi

VALIDATE(){ # Functions receive inputs through arguments just like shell script args
    if [ $1 -ne 0 ]; then
        echo "ERROR :: Installing $2 is Failed"
        exit 1
    else
        echo "Installing $2 is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $? "MySQL"       

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "python3"