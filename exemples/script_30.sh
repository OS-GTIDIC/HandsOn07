#!/bin/bash
touch file1 file2
echo -e "Game of\nThe Walking\nDeath" > file1
echo -e "Thrones\nDead\nNote" > file2
paste -d ' ' file1 file2
exit 0
