#!/bin/bash

# <<'COMMENTS'
# 1-check root user or not 
# 2-if root user proceed with script 
#     if proceed -check already installed or not 
#     if intalled inform user 
#     or 
#     install and inform user
# or else throug error
# COMMENTS

USERID=$(id -u)
echo "user ID is: $USERID"
if [ $USERID -ne 0 ]
then
    echo "please run this script with root priveleages"
    exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    echo "git is not installed, going to install"
    dnf install git -y
else
    echo "git is already installed, noting to do"

fi 