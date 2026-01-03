#!/bin/bash

path=$1

if [ $# -eq 0 ]; then
    echo "Arguments Passed are incorrect"
    exit 1
elif [ ! -e "$path" ]; then
    echo "Path doesnot exist"
    exit 1
elif [ -d "$path" ]; then
    echo "Files in the path:"
    ls -l "$path"
elif [ -f "$path" ]; then
    if [ -r "$path" ]; then
        echo "File has read permissions"
    else
        echo "File is not readable"
    fi    
    if [ -w "$path" ]; then
        echo "File has write permissions"
    else
        echo "File is not writable"
    fi    
else
    echo "Path exists but is not a regular file or dir"
fi




