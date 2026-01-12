#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage $0 <num1>"
    exit 1
fi

largest=$1

for num in $@; do 
    if ["$num" -gt "$largest" ]; then
        largest=$num
    fi
done

echo "Largest number is: $largest"