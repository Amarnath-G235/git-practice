#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then 
   echo "please run this script with sudo previleges"
   exit 1
fi
}

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
      echo -e " $2 is $R failed.. $N"
      exit 1
    else
      echo -e " $2 is $G success. $N"
    fi
}

CHECK_ROOT

# $@--->refers to all packages passed to it

for PACKAGE in $@
do
   dnf list installed $PACKAGE
   if [ $? -ne 0 ]
    then 
       echo "$PACKAGE is not installed..going to install it"
       dnf install $PACKAGE -y
       VALIDATION $? "installing $PACKAGE"
    else
       echo "$PACKAGE already installed. you cannot install twice."
fi
done