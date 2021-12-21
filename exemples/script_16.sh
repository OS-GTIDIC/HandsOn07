#!/bin/bash
if [ $# -eq 0 ]; then
  echo "error: number missing"; exit 1
fi
# External loop
for (( i=1; i<=$1; i++ )); do
  # Inner loop
  for (( j=1; j<=10; j++ )); do
    echo -n "`expr $i \* $j` "  # Example with expr
    #echo -n "$((i*j)) "         # Example with expansion
    #let c=i*j; echo -n "$c "    # Example with let
  done
  echo ""
done
exit 0
