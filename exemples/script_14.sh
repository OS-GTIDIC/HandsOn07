#!/bin/bash
echo "d: current datetime"
echo "l: current dir listing"
echo "q: exit program"
echo "Chose an option: "
read option
case "$option" in
  d|D) date
    ;;
  l|L) ls
    ;;
  q|Q) exit 0
    ;;
  *) echo "Incorrect option"
    exit 1
    ;;
esac
