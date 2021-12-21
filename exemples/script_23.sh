#!/bin/bash
if [ ! -z "$1" ] && echo "arg1 is: $1"
  then
  echo "arg1 exists"
fi
[ -z "$2" ] && echo "arg2 doesn't exist"
[ "$2" != "a" ] && echo "arg2 incorrect"
[ ! -f "$2" ] && echo "File $2 doesn't exist"
[ ! -f "$2" ] || ( tar -zcvf $2_$(date +%F).tar.gz $2 ) && echo "File $2 compressed"
exit 0
