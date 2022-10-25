#!/bin/bash


#$1 to $9 are positional parameters or arguments

#Sum of two Variables using commnad line arguments
sum=$(( $1 + $2 ))
echo "The Sum of Two Argument variable is : $sum"

#S0 Represet The Current Script 
echo "The Current Script is : $0"

#$# Represt the total number of command line arguments
echo "The total number of command line argument is : $#"

#$$ reperest the pid of current script
echo "THe PID of Script is : $$"
