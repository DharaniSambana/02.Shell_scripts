#!/bin/bash

CHECK_ROOT(){
    if [ $1 -ne 0 ]
    then
         echo "please run this script with root priveleages"
        exit 1
    fi
}

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo " $2  is not sucess"
        exit 1
    else
        echo " $2  sucessfull"
    fi
}

USERID=$(id -u)
CHECK_ROOT $USERID
dnf list installed mysqld
if [ $? -ne 0 ]
then
    echo "Mysql is not installed, installing it "
    dnf install mysql-server -y
    VALIDATE $? "MYSQL insatllation"
else
    echo "mysql is already installed"

dnf list insatlled git
if [ $? -ne 0 ]
then
    echo "git is not installed, installing it "
    dnf install git -y
    VALIDATE $? "git insatllation"
else
    echo "git is already installed"
