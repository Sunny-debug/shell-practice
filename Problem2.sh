#!/bin/bash

FILENAME=$1

count(){
    echo "Words"
    wc -w $FILENAME
    echo "Lines"
    wc -l $FILENAME
    echo "Characters"
    wc -c $FILENAME
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