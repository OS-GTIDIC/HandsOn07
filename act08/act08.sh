#!/bin/bash
N=$1
filaname=$2
complete=0
fail=0
echo "Hi, I am the factory [$$]..."
declare -a pids
for ((i=0;i<N;i++))
do
    #  Donar a p.sh permissos d'execució abans d'executar.
    ( $filaname ) &
    sleep 3
    pids[$i]=$!
    echo "Hi, the factory creates: ${pids[@]}..."
done
for p in ${pids[@]}; do
    if wait $p; then
    (( complete++ ))
    else
    (( fail++ ))
    fi
done
echo "$complete processes completed successfully."
echo "$fail processes failed to completed."
echo "Done."