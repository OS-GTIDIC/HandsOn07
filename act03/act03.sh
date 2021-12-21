#!/bin/bash
# To use: ./check.sh infinite_loop.sh
other_pid=`pidof -x $(basename $1)`
echo $other_pid
if [[ $other_pid ]]; then
    echo "ERROR: Aquest script ja s’esta executant amb pid $other_pid"
    exit 1
fi