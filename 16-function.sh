#!/bin/bash

# checking if the user has root access or not

USERID=$(id -u)

VALIDATE(){
    echo "exit status: $1"
}

if [ $USERID -ne 0 ]
then 
   echo "please run this script with sudo previleges"
   exit 1
fi

#checking if mysql is already installed or not. if not installed going to install it

dnf list installed mysql

VALIDATE $?