#!/bin/bash
# List files all files, filter the ones having '.sh' and sort them
ls | grep ".sh" | sort

# List all files, the output goes to the sed program
ls -l | sed -e "s/[aeio]/u/g"
exit 0
