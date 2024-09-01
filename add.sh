#!/bin/bash

read -p "enter first number: " num1
read -p "enter second number: " num2

echo $num1
echo $num2

var=$(($num1+$num2))


echo "total : $var"