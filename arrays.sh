#!/bin/bash

# index starts from 0, size is 3

echo "mixed datatype array"

mixed=("hello" 2 1.0 "world")

echo "first element ${mixed[0]}"
echo ${mixed[1]}
echo ${mixed[2]}
echo ${mixed[3]}
echo "used only \$mixed----$mixed"
echo ${mixed[@]}

echo "single datatype array"

FRUITS=("APPLE" "KIWI" "ORANGE") #Array

echo "First fruit is: ${FRUITS[0]}"
echo "Second fruit is: ${FRUITS[1]}"
echo "Third fruit is: ${FRUITS[2]}"

echo "First fruit is: ${FRUITS[@]}"