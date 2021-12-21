#!/bin/bash
if [“$#” -ne 1]
then
  echo “Only one argument is accepted!”
  exit
fi

if [ ! -d "safe_rm_recyle" ]
then
  mkdir safe_rm_recycle
else
  echo “Notice: The recycling directory already exists.”
fi

cp $1 safe_rm_recycle/
rm $1