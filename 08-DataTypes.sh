#!/bin/bash

# Everything is Shell is String
Number1=100
Number2=100
Name=Sunny

Sum=$(($Number1+$Number2+$Name)) # Arthimetic Expressions Always inside braces 

echo "Sum is :: ${Sum}"  # safe way to use variables

Items=("Earth" "Water" "Fire" "Ash")
echo "${Items}[*]"