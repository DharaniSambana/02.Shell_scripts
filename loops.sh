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

for package in $@
do 
    echo $package
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, installing it "
        dnf install mysql-server -y
        VALIDATE $? "MYSQL insatllation"
    else
        echo "$package is already installed"
    fi
done