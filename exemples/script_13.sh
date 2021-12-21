#!/bin/bash
if test $# -lt 2
  then # Input parameters check
  echo "Introduce at least 2 parameters"
  exit -1
fi
if [ $1 = $2 ]
  then # Check if it is the same file
  echo "Files are equal"
  exit -2
elif cmp $1 $2
  then # Command to compare files
  echo "Both files are equal (return code == 0)"
else
  echo "Both files are not equal (return code != 0)"
fi
exit 0
