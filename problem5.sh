#!/bin/bash

# Validate input: at least one number must be provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <num1> <num2> ..."
    exit 1
fi

# Assume the first argument is the largest
largest=$1

# Loop through all arguments
for num in "$@"; do
    if [ "$num" -gt "$largest" ]; then
        largest=$num
    fi
done

# Output the result
echo "Largest number is: $largest"
