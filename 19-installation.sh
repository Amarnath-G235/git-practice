#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "please run this script with sudo previleges"
   exit 1
fi

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
      echo " $2 command failed.."
      exit 1
    else
      echo " $2 command executed succesfully."
    fi
}

# git installation script

dnf list installed git
if [ $? -ne 0 ]
then 
   echo "git is not installed..going to install it"
   dnf install git -y
   VALIDATION $? "installing git"
else
   echo " already installed. you cannot install twice."
fi

 mysql installation script

dnf list installed mysql
if [ $? -ne 0 ]
then 
   echo "mysql is not installed..going to install it"
   dnf install mysql -y
   VALIDATION $? "installing mysql"
else
   echo "mysql is already installed.you cannot install twice."
fi