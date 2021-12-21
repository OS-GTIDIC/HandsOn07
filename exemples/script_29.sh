#!/bin/bash
touch file1 file2 file3
echo "knock knock" > file1
echo "Penny"       > file2
echo "WHAT!?"      > file3
cat file1 file2 file1 file2 file1 file2 file3 > file4
cat file4 | tail -n 3
exit 0
