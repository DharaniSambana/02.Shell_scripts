#!/bin/bash

#first block - I have used the read function to read the input from user
#second block - I have used the read function with -p so that i can include the message as well
#-p --Outputs the prompt string before reading user input.
#third block - I have used the read function with -s so that i can read inputs securly best use to read the passwords
#-s -Does not echo the user's input.
#fourth block - I have used the used command line inputs
#fifth block - I have used the variable and assigned the value

echo "for below i have used read function and user inputs "

echo "Enter person1 name"
read username1
echo "password"
read password

echo "person1= $username1"
echo "password = $password"

echo "--------------------------------"
echo "for below i have used read -p function and user inputs "

read -p "Enter person1 name:" val
echo " the person1 name is $val"

read -p "Enter password name" val1
echo " the password name is $val1"

echo "---------------------------------"

echo "for below i have used read -s function and user inputs "

echo "Enter person1 name"
read -s username2
echo "enter person2 name"
read -s username3

echo "person1= $username2"
echo "person1 = $username3"

echo "-------------------------------"
echo "for below i have used command line inputs "

clinput1=$1
clinput2=$2

echo "this is name of fist person given using command line $1"
echo "this is name of second person given using command line $clinput2"

echo "-------------------------------"
echo "for below i have used variables"

person1=suresh
person2=ram

echo $person1
echo $person2

echo "$person1: hello ${person2} good morning"
echo "$person2 : hello ${person1} how r u"
