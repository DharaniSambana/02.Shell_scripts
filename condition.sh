#!/bin/bash

#gt ,lt , eq , ne
read -p "enter the numer: " var1
echo "the number is : $var1"

if [ $var1 -gt 510 ]  
then

    echo "yes you are correct"
else
    echo "not correct"
fi

