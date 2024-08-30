#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "please run this script with root previleges"
fi

dnf install mysqld
