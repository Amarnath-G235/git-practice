#!/bin/bash

# checking if the user has root access or not

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "please run this script with sudo previleges"
   exit 1
fi

#checking if mysql is already installed or not. if not installed going to install it

dnf list installed mysql

if [ $? -ne 0 ]
then
   echo "mysql is not installed, please instll it"
   dnf install mysql -y
else
   echo "mysql is already installed,nothing to do"
fi