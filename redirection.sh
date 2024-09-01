#!/bin/bash

LOGS_FOLDER="/var/log/shell-scripts"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S) 
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

sudo mkdir -p $LOGS_FOLDER
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $1 -ne 0 ]
    then
         echo -e "$R please run this script with root priveleages $N" &>>$LOG_FILE
        exit 1
    fi
}

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo " $2  is not $R sucess $N" &>>$LOG_FILE
        exit 1
    else
        echo " $2 $G sucessfull $N" &>>$LOG_FILE
    fi
}
USERID=$(id -u)
CHECK_ROOT $USERID

for package in $@
do 
    echo $package
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, $G installing it $N " &>>$LOG_FILE
        dnf install $package -y
        VALIDATE $? "$package insatllation"
    else
        echo "$package is already $R installed $N" &>>$LOG_FILE
    fi
done