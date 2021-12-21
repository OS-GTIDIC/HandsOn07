#!/bin/bash
for i in 5 4 3 2 1
do
  echo "the bomb will explode in $i..."
done
echo "boom"
for ((i=5; i>0; i--))
do
  echo "you will respawn in $i..."
done
echo "welcome back"
exit 0
