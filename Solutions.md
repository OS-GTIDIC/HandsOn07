## Activitat 01:
Escriu un script count_txt.sh que conti el nombre total de fitxers **.txt** en el directori actual, i que mostri aquest número per pantalla. Pots utilitzar comandes existents com `ls` i `wc`, o pots usar una estructura iterativa.

* Opció 1:
    ```bash
    #!/bin/bash
    ls -l | grep .txt | wc -l
    ```
* Opció 2:
    ```bash
    #!/bin/bash
    i=0
    for file in *.txt
    do
        let i=$i+1
    done
    echo $i
    ```

## Activitat 02: 
La comanda `rm` estàndard no demana confirmació abans d’eliminar un arxiu. Escriu un script anomenat `safe_rm`, tal que faci una còpia abans d’eliminar un únic arxiu (és a dir, únicament permetrà eliminar un sol arxiu a la vegada), fent el següent:
* Agafa un únic argument des de la línia de comandes. Mostra un missatge d’error si no s’ha passat cap argument o si n’hi ha més d’un.
* Crea un directori anomenat safe_rm_recycle en el directori home de l'usuari que executa l'scrpit, si encara no existeix.
 * Còpia l’arxiu indicat pel primer argument al directori safe_rm_recycle.
* Elimina l’arxiu del directori actual.

Desa aquest script en un directori anomenat bin dins del teu directori inicial. Després afegeix el directori **$HOME/bin** al *PATH* del sistema de forma que puguis executar el script safe_rm des de qualsevol directori. Indica el procediment seguit per afegir el script al *PATH*.

```bash
#!/bin/bash
if ["$#" -ne 1]
then
  echo “Only one argument is accepted!”
  exit
fi

if [ ! -d "safe_rm_recyle" ]
then
  mkdir safe_rm_recycle
else
  echo “Notice: The recycling directory already exists.”
fi

cp $1 safe_rm_recycle/
rm $1
```

```shell
mkdir -p $HOME/bin
cp act02/act02.sh $HOME/bin
export PATH=$PATH:$HOME/bin
```
Si voleu afegir de forma permanent per l'usuari:

```shell
echo "export PATH=$PATH:$HOME/bin" >> $HOME/.bashrc
```
## Activitat 03:
Completar aquest script.

```bash
#!/bin/bash 
# @TODO x és una combinació de pidof i basename 
x=??????
if [ condition ]; then
# @TODO Substituir $x per les variables que continguin la informació.
echo "[ERROR]: Aquest script ja s’esta executant amb pid $x"
fi
```

```bash
#!/bin/bash
x=`pidof -x $(basename $1)`
echo $x
if [[ $x ]]; then
    echo "ERROR: Aquest script ja s’esta executant amb pid $x"
    exit 1
fi
```

## Activitat 04:
Completar aquest script.

```bash
#!/bin/bash
if [ condition ]; then
    # @TODO Substituir $x per les variables que continguin la informació.
    echo "[ERROR]: Aquest script ja s’esta executant amb pid $x"
    echo "[INFO]: Eliminant procés amb pid $x"
    # @TODO Comanda per eliminar el procés amb pid $x, (tip: kill)
fi

# @TODO Substituir $name i $pid per les variables que continguin la informació.
echo "[INFO]: Executant el script amb nom $name amb el següent $pid."

# @TODO Fer un recubriment amb el programa $name.
```

```bash
#!/bin/bash
x=`pidof -x $(basename $1)`
if [ $x ]; then
    # @TODO Substituir $x per les variables que continguin la informació.
    echo "[ERROR]: Aquest script ja s’esta executant amb pid $x"
    echo "[INFO]:  Eliminant procés amb pid $x"
    # @TODO Comanda per eliminar el procés amb pid $x, (tip: kill)
    kill -9 $x
fi
# @TODO Substituir $name i $pid per les variables que continguin la informació.
echo "[INFO]: Executant el script amb nom $1 amb el següent $$."

# @TODO Fer un recubriment amb el programa $name.
exec ./$1
```

## Activitat 09:

Aquesta activitat està resolta a **act09/act09.sh**. Exemple d'execució:

```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/act09# ./act09.sh  /root/resources/HandsOn07/act09/p.sh
Aquest script requereix 2 arguments.
./act09.sh N exec
  N ha de ser un enter més gran que 0.
  exec ha de ser un fitxer.
```

```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/act09# ./act09.sh 0  /root/resources/HandsOn07/act09/p.sh
Aquest script requereix 2 arguments.
./act09.sh N exec
  N ha de ser un enter més gran que 0.
  exec ha de ser un fitxer.
```

```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/act09# ./act09.sh  /root/resources/HandsOn07/act09/p
Aquest script requereix 2 arguments.
./act09.sh N exec
  N ha de ser un enter més gran que 0.
  exec ha de ser un fitxer.
```

```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/act09# ./act09.sh 2 /root/resources/HandsOn07/act09/p.sh
 Escull una opció 
1. Executar fàbrica de processos.
2. Eliminar permissos.
3. Eliminar executable.
4. Sortir.
Seleccione una opcion [1 - 4]
```

## Activitat 10

```bash
#!/bin/bash
cat > act10.data << 'EOT'
102
071
210
153
EOT
clear
cat act10.data
declare -i SUM=0
while read X; do
SUM+=$X
done < act10.data
echo "Suma: $SUM != 536"
```


El problema d'aquest codi és que Bash interpreta qualsevol nombre que comença per 0 com un valor octal en lloc de decimal. Per tant, el programa funciona, però no ens dóna el resultat esperat, ja que no estem sumant el 071 decimal. Estem sumant el valor en octal.

Per solucionar aquest problema podem:

```bash
#!/bin/bash
cat > act10.data << 'EOT'
102
071
210
153
EOT
clear
cat act10.data
declare -i SUM=0
while read X; do
SUM+="10#$X"
done < act10.data
echo "Suma: $SUM != 536"
```

