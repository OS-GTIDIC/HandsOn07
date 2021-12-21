#!/bin/bash
other_pid=`pidof -x $(basename $1)`
echo $other_pid
if [ $other_pid ]; then
    # @TODO Substituir $x per les variables que continguin la informació.
    echo "[ERROR]: Aquest script ja s’esta executant amb pid $other_pid"
    echo "[INFO]:  Eliminant procés amb pid $other_pid"
    # @TODO Comanda per eliminar el procés amb pid $x, (tip: kill)
    kill -9 $other_pid
fi
# @TODO Substituir $name i $pid per les variables que continguin la informació.
echo "[INFO]: Executant el script amb nom $1 amb el següent $$."

# @TODO Fer un recubriment amb el programa $name.
exec ./$1

