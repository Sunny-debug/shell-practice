#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please Get Admin Access"
    exit 1 # Other than 0 means failure
fi

VALIDATE(){ # Functions receive inputs through arguments just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R Failure $N"
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}

dnf list installed mysql
# Install If it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"       
else
    echo -e "MySQL Already Exist $G ... Skipping ... $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"       
else
    echo -e "Nginx Already Exist $G ... Skipping ... $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"       
else
    echo -e "Python3 Already Exist $G ... Skipping ... $N"
fi