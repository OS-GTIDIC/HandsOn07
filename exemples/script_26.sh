#!/bin/bash
IFS=:     # Internal Field Separator set to ':'
while read name pass uid rest
do
  echo "user with uid = $uid, name = $name, rest = $rest"
done < /etc/passwd
exit 0
