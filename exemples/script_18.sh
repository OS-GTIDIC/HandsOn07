#!/bin/bash
if [ $# -eq 0 ]; then
  echo "error - number missing"; exit 1
fi
echo "Try to guess the number between 1 and 10"
n=$RANDOM
echo "Random: $n"
let "n=(n%10) + 1"
echo "number: $n"
tries=0
guess=0
until [ "$guess" -eq "$n" -o "$tries" -ge $1 ]
do
  echo -n "Write a number: "
  read guess
  let "tries=$tries+1"
  echo "Tries = $tries"
done
if [ "$n" -eq "$guess" ]
  then echo "Victory ;-)"
  else echo "Defeat ;-("
fi
exit 0
