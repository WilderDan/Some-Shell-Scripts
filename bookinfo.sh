#!/bin/bash

# Author:    Dan Wilder
# Class:     CMP SCI 2750
# Project:   #3; Script #3
# Due Date:  April 12th; April 19th (late due date)

# bookinfo.sh 
#   Help organize a book list. Each book has the following 
#   information:
#
#     Booktitle:
#     Author(s):
#     Publisher:
#     Year of Publication:
#
#   All books stored in a file called 'books'. Information here delimited
#   by the '~' character.
#
#   - A optional number argument means user should enter that many books' information.
#   - A argument 'print' prints the 'books' file to 'book_print' which has the
#     same information, but in a more readable format. 
#   - '-f PATTERN' option to find and print only books with PATTERN in it
#   - '-i' means to ignore case
#

# Reset POSIX variable in case been used elsewhere
OPTIND=1         

# Initialize flags 
findFlag=0
ignoreCaseFlag=0
bookprint=0

# String to search for if findFlag is set
pattern=""

# Optional numeric argument for how many books to add
numBooks=0

# Check for options and set appropriate flags
while getopts "if:n:" opt; do
    case "$opt" in

    i)  ignoreCaseFlag=1
        ;;

    f)  findFlag=1
        pattern=$OPTARG
        ;;

    n)  # Make sure that $OPTARG is a positive integer
        case $OPTARG in
        ''|*[!0-9]*) numBooks=0;;
        *) numBooks=$OPTARG ;;
        esac
        ;;
    esac
done

# Check if remaining non-option argument is 'print' 
shift $(expr $OPTIND - 1 )

# If so
if [ "$1" = "print" ]; then
  # Set flag 
  bookprint=1
fi

# Add 'numBooks' books to 'books' file... that's a lot of books in one line
# Perhaps I could write a ... nevermind
for i in $(seq 1 $numBooks)
do
  echo "\n----------------------------------------"
  echo "Appending entry #$i of $numBooks to file 'books'"
  echo "----------------------------------------"
  echo -n "Booktitle:  "
  read title
  echo -n "Author(s):  "
  read authors
  echo -n "Publisher:  "
  read publisher
  echo -n "Year of Publication:  "
  read publication 

  echo "$title~$authors~$publisher~$publication" >> books 
done

# Print list of book from 'books' to 'book_print' file if print argument specified
if [ $bookprint -eq 1 ]; then

  # Clear book_print before setting
  echo "" > book_print

  echo findFlag before
  # If find flag was set
  if [ $findFlag -eq 1 ]; then
     echo 'findflag after'

    if [ $ignoreCaseFlag -eq 1 ]; then
      grep -i "$pattern" < books > tempBookBuffer
      echo test
    else 
      grep "$pattern" < books > tempBookBuffer
    fi

    # Set variable to buffer
    bookBuffer=tempBookBuffer

  else
    bookBuffer=books;
  fi

  while read line           
  do  

    # Extract fields from buffer          
    title=$(echo $line | cut -d'~' -f1)
    authors=$(echo $line | cut -d'~' -f2) 
    publisher=$(echo $line | cut -d'~' -f3) 
    publication=$(echo $line | cut -d'~' -f4)

    # Print formatted fields to file 'book_print'
    printf "%-20s  %-32s\n" "Booktitle:" "$title" >> book_print
    printf "%-20s  %-32s\n" "Author(s):" "$authors" >> book_print
    printf "%-20s  %-32s\n" "Publisher:" "$publisher" >> book_print
    printf "%-20s  %-32s\n" "Publication:" "$publication" >> book_print
 
    # Newline between entries
    echo "" >> book_print    
 
  done < $bookBuffer 
fi

# Clean up
if [ $findFlag -eq 1 ] && [ $bookprint -eq 1 ]
then
  rm tempBookBuffer  
fi
