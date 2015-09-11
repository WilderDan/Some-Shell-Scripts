Dan Wilder
CS 2750
Project #3

This project contained 3 scripts.

fizzbuzz.sh
  This script is run with single integer parameter given from command line when
  script is called. If this parameter is divisible by BOTH 3 and 5, the script 
  prints FizzBuzz. If it is divisible by 3, but not 5, it prints Fizz. If it
  is divisible by 5 and not by 3, it prints buzz. If it is not divisible by
  either 3 or 5, then it prints the numbers from 1 to the parameter value
  on separate lines. If no parameter is given, the script sets a default value 
  of 20. 

flcln.sh
  This script accepts a single parameter which refers to starting directory to
  search. If no such parameter is given, the starting directory will be the 
  current directory. From the starting directory, the script looks for all
  regular files within it and its subdirectories and sorts them based on file
  size in descending order. This sorted listing will be printed to stdout with
  each line consisting of the filename without the pathname and the file's size in bytes.
  If any empty files are found, the user will be prompted to remove them.

bookinfo.sh
  This script helps organize a list of books. A file called 'books' exists as a data file
  for this purpose with each line corresponding to an entry. Each line is separated into
  four fields: title, author, publisher, publication date. Each field is delimited by a ~ 
  character. Calling the script with -n option followed by num, causes the script to 
  to append num entries to the books file, prompting the user for input to do so. Calling
  the script with 'print' causes the script to print out the information in the 'books'
  file to another file called 'book_print' which is more readable. The option -f changes
  how print functions in that -f pattern means that the script should print to 'book_print'
  only lines in 'books' that have pattern in it. The option -i can further change how this
  works by informing the script to ignore case when searching for pattern in 'books'.
  The -f option only makes sense when print is specified, otherwise it does nothing. The 
  -i option also only makes sense when -f is specified as is print.

  Example Call:
  sh bookinfo.sh -n3 -f 'Dan Wilder' -i print

  3 book entries will be appended first, then the script will print lines that match the
  pattern "Dan Wilder" regardless of case from 'books' file to 'book_print'. 

  *Limitation*
   While the options n, f, and i can be given in any order, 'print' must come after all options 
   are specified.
