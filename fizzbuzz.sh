#!/bin/bash

# Author:    Dan Wilder
# Class:     CMP SCI 2750
# Project:   #3; Script #1
# Due Date:  April 12th; April 19th (late due date)

# fizzbuzz.sh 
#   Prints the numbers 1 through n, one on each line
#   n specified as command line argument; 20 if not specified
#
#   If the number is divisible by both 3 AND 5 then print 'FizzBuzz' instead
#   Else If number is divisible by 3 then print 'Fizz' instead
#   Else if number is divisible by 5 then print 'Buzz' instead

# Set n from command line
n=$1 

# Check if it was ACTUALLY specified; if not set to 20
if [ "$n" = "" ]; then 
  n=20
fi

# Check if n is divisible by both 3 AND 5
if [ "$((n%3))" -eq "0" ] && [ "$((n%5))" -eq "0" ]; then
  echo FizzBuzz

# Check if n is divisible by 3 
elif [ "$((n%3))" -eq "0" ]; then
  echo Fizz

# Check if n is divisible by 5
elif [ "$((n%5))" -eq "0" ]; then
  echo Buzz

# Else print numbers 1 through n; one on each line
else
  for i in $(seq 1 $n); do
    echo $i
  done
fi
