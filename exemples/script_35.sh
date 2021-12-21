#!/bin/bash
grep -nv '^$' $0          # Get the lines (with line number) that are not blank

ls -lh | grep '^d'        # List only directories

ls -lh | grep '[^\.sh]$'  # List all files not ending in .sh

grep '[a-z]\{11\}' $0      # List all lines with at least 5 consecutive lowercase letters

exit 0
