#!/bin/bash

echo "Please Enter the Number"
read Number

if [ $(($Number % 2)) -eq 0 ]; then
    echo "Given Number is Even"
else
    echo "Given Number is Odd"
fi        
