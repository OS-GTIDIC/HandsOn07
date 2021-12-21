#!/bin/bash
echo "Script name: $0"
echo "Number of arguments: $#"
echo "Arguments are: $@"
ls -lh
echo "Last command exit code: $?"
more wololo
echo "Last command exit code: $?"
echo "My PID: $$"
top &
echo "Last command PID: $!"
kill -9 $!
echo "Last command exit code: $?"
exit 0
