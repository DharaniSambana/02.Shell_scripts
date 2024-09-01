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
if [ USERID -ne 0 ]
then
    echo "please run this script with root priveleages"
    exit 1
   
else
    echo "you can install but wait"

fi 