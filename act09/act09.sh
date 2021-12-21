#!/bin/bash
clear

# Revisarem si l'executable passat com a paràmetre existeix. Si existeix l'eliminarem.
check_pid(){
other_pid=$(pidof -x $(basename $1))
echo $other_pid
if [ $other_pid ]; then
    echo "[ERROR]: Aquest script ja s’esta executant amb pid $other_pid"
    echo "[INFO]:  Eliminant procés amb pid $other_pid"
    kill -9 $other_pid
fi
}

# Ajuda de com fer servir l'script
help(){
    echo "./act09.sh N exec"
    echo "  N ha de ser un enter més gran que 0."
    echo "  exec ha de ser un fitxer."
    exit 1
}

# Aquest funció revisarà que executem el script amb els arguments correctes.
check_args(){

  if [ $# != 2 ]; then
    echo "Aquest script requereix 2 arguments."
    help
  fi

  if [[ ! -f $2 || $1 -le 0 ]]; then
    help
  fi

}

# Aquesta funció revisa si un fitxer té permissos d'execució. En cas contrari, els assignem.
check_exec(){
    if ! [[ -x "$1" ]]; then
        chmod +x $1
    fi
}

# Aquesta funció eliminarà els permissos d'execució del primer argument.
remove_exec(){
    chmod -x $1
}

# Aquesta funció eliminarà els fitxer passat com a primer argument.
remove_file(){
    rm $1
}

# Aquesta funció executarà en background la factoria desenvolupada a l'activitat 8 i esperarà que finalitzi.
run_factory(){
    ../act08/act08.sh "$1" "$2" & 
    wait $!
}

check_args $1 $2
N=$1
filename=$2
check_pid $filename
check_exec $filename

while :
do
echo " Escull una opció "
echo "1. Executar fàbrica de processos."
echo "2. Eliminar permissos."
echo "3. Eliminar executable."
echo "4. Sortir."
echo -n "Seleccione una opcion [1 - 4]"
read opc
    case $opc in
        1) echo "Executant la fàbrica de processos...";
        run_factory $filaname $N;;
        2) echo "Eliminant permissos de $filename";
        remove_exec $filename ;;
        3) echo "Eliminant fitxer de $filename";
        remove_file $filename ;;
        4) echo "Acabant...";
        exit 0;;
        *) echo "$opc no es vàlid?";;
    esac
done