#!/bin/bash

echo "for below i have used read function and user inputs "

echo "Enter person1 name"
read username1
echo "password"
read password

echo "person1= $username1"
echo "password = $password"

echo "for below i have used read -s function and user inputs "

echo "Enter person1 name"
read -s username1
echo "enter person2 name"
read -s username2

echo "person1= $username1"
echo "person1 = $username2"


echo "for below i have used command line inputs "

clinput1=$1
clinput2=$2

echo "this is name of fist person given using command line $1"
echo "this is name of second person given using command line $clinput2"


echo "for below i have used variables"

person1=suresh
person2=ram

echo $person1
echo $person2

echo "$person1: hello ${person2} good morning"
echo "$person2 : hello ${person1} how r u"
