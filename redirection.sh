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
         echo -e "$R please run this script with root priveleages $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo -e " $2  is not $R sucess $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e " $2 $G sucessfull $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE: $N sudo sh redirections.sh package1 ..." 
    exit 1
}
USERID=$(id -u)
echo "script started executing at : $(date)" | tee -a $LOG_FILE
CHECK_ROOT $USERID
if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@
do 
    echo $package
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$package is not installed, $G installing it $N " | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package insatllation" 
    else
        echo -e "$package is already $R installed $N" | tee -a $LOG_FILE
    fi
done