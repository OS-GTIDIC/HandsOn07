#!/bin/bash
echo "-------------------"
grep root /etc/passwd
echo "-------------------"
ps -e | grep $USER
echo "-------------------"
ps -e | grep -c $USER
echo "-------------------"
ps -e | grep -n $USER
echo "-------------------"
exit 0
