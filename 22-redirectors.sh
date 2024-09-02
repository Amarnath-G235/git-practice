#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) # $0--> will gives us script name.
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
       echo -e "$R please run this script with sudo previleges $N" | tee -a &>>$LOG_FILE
       exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
      echo -e " $2 is $R failed.. $N" | tee -a $LOG_FILE
      exit 1
    else
      echo -e " $2 is $G success. $N"  | tee -a $LOG_FILE
    fi
}



USAGE(){
    echo -e " $R usage :: $N sudo sh.22-redirectors.sh PACKAGE1 PACKAGE2 PACKAGE3.."
    exit 1
}

echo "script started executing at :$(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then
   USAGE
fi

for PACKAGE in $@
do
   dnf list installed $PACKAGE &>> $LOG_FILE
    if [ $? -ne 0 ]
    then 
       echo -e "$PACKAGE is $R not installed.. going to install it $N" | tee -a $LOG_FILE
       dnf install $PACKAGE -y &>>$LOG_FILE
       VALIDATE $? "installing $PACKAGE"
    else
       echo -e "$PACKAGE $Y already installed. you cannot install twice.$N" | tee -a $LOG_FILE
    fi
done