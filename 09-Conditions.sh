#!/bin/bash

Number=$1

if [ $Number -lt 10 ]; then
    echo "True"
elif [ $Number -eq 10 ];
    echo "Cannot Process"    
else
    echo "False"
fi           