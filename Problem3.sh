#!/bin/bash

DIR=$1
old=FOO
new=BAR

find $DIR -type f -name "*.conf" -exec sed -i.bak 's/FOO/BAR/g' {} \;

