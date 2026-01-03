#!/bin/bash

FILENAME=$1

if [ $# -eq 0 ]; then
    echo "Please Enter the Filename"

lines=$(wc -l $FILENAME)
echo "No of lines in the $FILENAME:: $lines"