#!/bin/bash
maximum () {
  max=0
  while [ $# -ne 0 ]; do
    echo "Processing parameter $1"
    if [ "$1" -ge "$max" ]; then
      max=$1
    fi
    shift
  done
  return $max
}
maximum 4 8 15 16 23 42
echo "Maximum [4 8 15 16 23 42] is: $?"
exit 0
