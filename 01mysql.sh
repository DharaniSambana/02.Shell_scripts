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
echo "script started executing at : $(date)" | tee -a $LOG_FILE

CHECK_ROOT $USERID

dnf install mysql-server -y
VALIDATE $? "$G Installing MYSQL server $N "

systemctl enable mysqld
VALIDATE $? "Enabled mysql server"

systemctl start mysqld
VALIDATE $? "started mysql server"

mysql_secure_installation --set-root-pass ExpenseApp@1
VALIDATE $? "setting up root passwprd for mysql server"
