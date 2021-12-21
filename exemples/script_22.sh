#!/bin/bash
if [ ! -z "$1" ] && echo "arg1 = $1" && \
  [ ! -z "$2" ] && echo "arg2 = $2"
  then
  echo "There are at least 2 arguments"
else
  echo "There are less than 2 arguments"
  exit 1
fi
[ "$1" == "a" ] && echo "arg1 correct"
[ -f "$2" ] && echo "File $2 doesn't exist"
[ -f "$2" ] && ( tar -zcvf $2_$(date +%F).tar.gz $2 ) && echo "File $2 compressed"
exit 0
