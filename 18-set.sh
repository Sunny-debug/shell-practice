#!/bin/bash

set -e

# ERROR(){
#     echo "There is an error in $LINENO, Cmd is :: $BASH_COMMAND"
# }

trap 'echo "There is an error in $LINENO, Cmd is :: $BASH_COMMAND"' ERR

echo "Hello.."
echo "Before error.."
ccjdjd; # Signal
echo "After Error"