#!/bin/bash
echo -e "GoT\tTWD\tTB\tDN\tTBBT" > file1
cut -f2 file1
cut -c1-7 file1
uname -a | cut -d" " -f1,3,11,12
exit 0
