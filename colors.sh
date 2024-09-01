#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"


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
        echo -e " $2  is not $R sucess $N"
        exit 1
    else
        echo  -e " $2  $G sucessfull $N"
    fi
}

USERID=$(id -u)
CHECK_ROOT $USERID
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "Mysql is not installed, installing it "
    dnf install mysql-server -y
    VALIDATE $? "MYSQL insatllation"
else
    echo -e "$G mysql $R is already installed"
fi

dnf list insatlled git
if [ $? -ne 0 ]
then
    echo "git is not installed, installing it "
    dnf install git -y
    VALIDATE $? "git insatllation"
else
    echo -e  "$G git $R is already installed"
fi
