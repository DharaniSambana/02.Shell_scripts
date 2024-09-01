#!/bin/bash


USERID=$(id -u)
echo "user ID is: $USERID"
if [ $USERID -ne 0 ]
then
    echo "please run this script with root priveleages"
    exit 1
fi

dnf list installed mysqld
if [ $? -ne 0 ]
then 
    echo "mysqld is not installed, going to install"
    dnf install mysql-server -y
    if [ $? -ne 0 ]
    then 
        echo "mysql installation is not sucess"
        exit 1
    else
        echo "mysql installation sucess"
        echo "starting mysqld service"
        systemctl start mysqld
        systemctl enable mysqld
        systemctl status mysqld
        exit 0

    fi
else
    echo "git is already installed"
    echo "starting mysqld service"
    systemctl start mysqld
    systemctl enable mysqld
    systemctl status mysqld
    exit 0


fi 