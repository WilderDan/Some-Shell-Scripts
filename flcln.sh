#!/bin/bash

# Author:    Dan Wilder
# Class:     CMP SCI 2750
# Project:   #3; Script #2
# Due Date:  April 12th; April 19th (late due date)

# flcln.sh 
#   Give a list of all files in a directory hierarchy sorted by size.
#   Script works recursively (i.e. on all subdirectories).
#   Pathnames will be omitted. The user will be prompted if they
#   they would like to delete any listed file of size 0. Directory
#   to search can be specified as command line arguments. Default is
#   current directory. 

# Set search directory 
directory=$1

# If no search directory specified, use current directory
if [ "$directory" = "" ]; then
  directory=.
fi

for file in $(find $directory -type f -ls | sort -nrk7 | tr -s [:blank:] " " | cut -d' ' -f11)
  # First 'find' is called which starts at the specified directory and works recursively. 'find'
  # looks for all regular files and outputs in ls -dils format. This output is passed to the input
  # of 'sort' which sorts based on the numeric value of key 7 in reverse order i.e. file size from 
  # largest to smallest. This output is passed to 'tr' which translates multiple whitespace into a 
  # SINGLE ' ' (space character) so that when output is passed to 'cut', 'cut' can use the space 
  # as a delimiter to select to 11th field which is a filename. Within the loop, $file 
  # references ONE such filename.  
do
  # File has already been found; Focus is 'printf' option to show file size and omit pathname
  find $file -printf "[%12s bytes]\t%f\n"

  # If file is empty
  if [ ! -s $file ]; then
    # Ask user if they would to delete it
    rm -i $file
  fi
done
