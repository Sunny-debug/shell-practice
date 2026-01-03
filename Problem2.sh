#!/bin/bash

FILENAME=$1

count(){
    echo "Words"
    wc -w $FILENAME | awk '{print $1}'
    echo "Lines"
    wc -l $FILENAME | awk '{print $1}'
    echo "Characters"
    wc -c $FILENAME | awk '{print $1}'
}

if [ $# -eq 0 ]; then
    echo "Please Enter the Filename"
    exit 1
elif [ ! -e "$FILENAME" ]; then
    echo "File doesnot exist"
    exit 1
elif [[ ! -r "$FILENAME" ]]; then
    echo "File is not readable"    
    exit 1
elif [ ! -s "$FILENAME" ]; then
    echo "Count=0"
    exit 0
else
    count
fi   