#!/bin/bash

COUNT=5

while [ $COUNT -gt 0 ]; do
    echo "Time Left: $COUNT"
    sleep 1
    COUNT=$((COUNT - 1))    
done

echo "Time's up!!!!"