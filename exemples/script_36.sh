#!/bin/bash
wc -l /etc/passwd
basename /bin/ls
dirname /bin/ls
nohup ls &    # Output goes to nohub.out
trap 'echo "Ctrl+C disabled"' 2
read something
exit 0
