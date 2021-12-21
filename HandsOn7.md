# HandsOn 07: Introducció al llenguatge bash-scripting

L'intèrpret de comandes d'UNIX s'anomena **shell**. Recordeu que la **shell** ens permet executar ordres utilitzant el nucli del sistema operatiu i ocultant-lo de l'usuari que executa l'ordre. Aquest intèrpret de comandes és un programa i al llarg de la  la història del UNIX hi ha hagut molts programadors que s'han decidit a construir-ne un d'acord amb les seves preferències personals.

* Intèrpret d'ordres de Bourne ( sh )
* El C- intèrpret d'ordres ( csh )
* El shell de Korn ( ksh )
* Intèrpret d'ordres de GNU ( bash : Bourne-Again SHell ).

Per poder veure totes les shells que teniu instal·lades al vostre sistema operatiu podeu consultar:

```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07# cat /etc/shells
# /etc/shells: valid login shells
/bin/sh
/bin/bash
/usr/bin/bash
/bin/rbash
/usr/bin/rbash
/bin/dash
/usr/bin/dash
```

En aquest **HandsOn** utilitzarem l'intèrpret de comandes de [GNU (Bash)](https://www.gnu.org/software/bash/manual/html_node/index.html).  Cada ordre és una seqüència de paraules separades per espais tal que la primera paraula és el nom de l'ordre i les següents són els seus arguments. Així, per exemple, per esborrar els fitxers: fitxer_1 i fitxer_2 es podria especificar l'ordre següent: `rm fitxer_1 fitxer_2`

Un cop llegida l'ordre, l'intèrpret d'ordres iniciarà la seva execució en el context d'un nou procés (sub-shell) i esperarà la seva finalització abans de continuar (manera d'execució foreground). L'execució d'una ordre retorna un valor que reflecteix l'estat de finalització. Per convenció, un valor diferent de 0 indica que ha passat algun tipus d'error. Així, a l'exemple anterior, si algun dels fitxers especificats no existeix , rm tornarà un valor diferent de 0. Com es veurà més endavant, aquest valor pot ser consultat per l'usuari o per posteriors ordres. Si una línia conté el caràcter comença amb  # , això indicarà que la resta dels caràcters que apareixen a partir d'aquest caràcter es consideraran un comentari i, per tant, l'intèrpret d'ordres els ignorarà. Encara que es poden fer servir comentaris quan es treballa en mode interactiu, el seu ús més freqüent és dins de shell scripts.

## Fitxers d'inici de Bash

L'intèrpret d'ordres **/bin/bash** utilitza una col·lecció de fitxers d'inici per ajudar a crear un entorn on executar-se. Cada fitxer té un ús específic i pot afectar de manera diferent els entorns interactius de l'usuari. Els fitxers del directori /etc proporcionen generalment les configuracions globals. Si al vostre directori personal hi ha un fitxer equivalent, aquest pot prevaldre sobre les configuracions globals.

Una shell s'executa després d'una entrada correcta al sistema mitjançant */bin/login*, llegint el fitxer */etc/passwd*. L'intèrpret invocat llegeix normalment durant l'arrencada */etc/profile* i el seu equivalent privat, *~/.bash_profile*.

Una shell no interactiva succeeix quan s'executa un script. És no interactiu perquè està processant el script i no està esperant que l'usuari introdueixi una ordre. Per a aquestes invocacions de l'intèrpret només es fa servir l'entorn heretat del pare.

Una shell que s'executa després d'una ordre com */bin/bash* o */bin/su* enlloc de consultar el profile,  copia l'entorn pare i després llegeix les instruccions de configuració addicionals per a l'arrencada al fitxer *~/.bashrc* de l'usuari.

Una forma ràpida per consultar si la shell actual (és una login shell o no) podem executar: `echo $0`

El fitxer *~/.bash_logout* no s'utilitza per invocar un intèrpret. És llegit i executat quan un usuari surt d'un intèrpret interactiu.

En resum:

* Si volem definir variables d'entorn i configuracions que afectin  a tots els usuaris del sistema: (Es necessiten permisos de root per editar/modificar aquests fitxers)
    * **/etc/profile** : S'executa quan qualsevol usuari inicia la sessió.
    * **/etc/bashrc** : S'executa cada cop que qualsevol usuari executa el programa bash.

* Si volem definir variables d'entorn i configuracions que afectin a un únic usuari concret:
    * **~/.bash_profile**:  S'executa el .bash_profile de user1 quan el user1 inicia la sessió.
    * **~/.bashrc**:S'executa el .bashrc de user1 quan user1 executa un programa bash.


---

**Activitat 01**: Escriu un script count_txt.sh que conti el nombre total de fitxers ".txt" en el directori actual, i que mostri aquest número per pantalla. Pots utilitzar comandes existents com `ls` i `wc`, o pots usar una estructura iterativa.

---

**Activitat 02**:  La comanda `rm` estàndard no demana confirmació abans d’eliminar un arxiu. Escriu un script anomenat `safe_rm`, tal que faci una còpia abans d’eliminar un únic arxiu (és a dir, únicament permetrà eliminar un sol arxiu a la vegada), fent el següent:

Agafa un únic argument des de la línia de comandes. Mostra un missatge d’error si no s’ha passat cap argument o si n’hi ha més d’un.
Crea un directori anomenat **safe_rm_recycle** en el directori home de l'usuari que executa l'scrpit, si encara no existeix.
Còpia l’arxiu indicat pel primer argument al directori **safe_rm_recycle**.
Elimina l’arxiu del directori actual.
Desa aquest script en un directori anomenat bin dins del teu directori inicial. Després afegeix el directori *$HOME/bin* al *PATH* del sistema de forma que puguis executar el script safe_rm des de qualsevol directori. Indica el procediment seguit per afegir el script al *PATH*.

## Fàbrica de processos

En aquest punt codificarem un script que comprovi si existeix un altre script amb el mateix nom i PID diferent executant-se. En cas afirmatiu, mostrarem a la pantalla *ERROR: Aquest script ja està en execució el seu pid és xxxx*.

Heu d'utilitzar les següents comandes per generar el script:

```shell
$ sleep 120 &; pidof sleep;
$ basename /home/user/a.sh
```

Per a més informació consultar:

* `man pidof`
* `man basename`

---
**Activitat 03:** Completar aquest script. 

```bash
#!/bin/bash 
# @TODO x és una combinació de pidof i basename 
x=??????
if [ condition ]; then
# @TODO Substituir $x per les variables que continguin la informació.
echo "[ERROR]: Aquest script ja s’esta executant amb pid $x"

fi
```

Podeu comprovar el bon funcionament del vostre script. Codificant un script que faci un bucle infinit, executant-lo i en un altre terminal utilitzar el script **check.sh**.

```bash
#!/bin/bash
# infinite_loop.sh

while :
do
    echo "Press [CTRL+C] to stop.."
    sleep 1
done
```

Exemple:

* Terminal 1:
```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./infinite_loop.sh
```
* Terminal 2:
```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check.sh infinite_loop.sh

Error aquest script ja s'esta executant amb pid 16863
```

---

**Activitat 03**: En aquest punt modificareu l'script per executar el procés en cas que no existeixi i si existeix s'ha d'eliminar el procés i executar-lo de nou. En els dos casos s'ha de notificar per la pantalla.

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

---

**Activitat 04:** Heu de fer un script que agafi un paràmetre i comprovi si és un nombre enter més gran de 0.

```bash
#!/bin/bash
N=$1
if ! [ $N -gt 0 ] ; then
echo "error: Not a number greater than 0" >&2;
exit 1
fi
```

La comanda `echo` per defecte escriu al descriptor de **fitxer 1 (stdout)**. Aquesta redirecció **>&2** fa que echo escrigui al descriptor de **fitxer 2 (stderr)**.  

```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh 22
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh 1
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh 0
error: Not a number greater than 0
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh -3
error: Not a number greater than 0
```

> Que passa amb els nombres decimals? 

```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh 3.4
./check_args.sh: línia 3: [: 3.4: s'esperava una expressió amb enters
error: Not a number greater than 0
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh 3,4
./check_args.sh: línia 3: [: 3,4: s'esperava una expressió amb enters
error: Not a number greater than 0
```

Per poder revisar nombre decimals hem d'introduir les expressions regulars:

```bash
#!/bin/bash
N=$1
decimal_expr='^[0-9]+([.][0-9]+)?$'
if ! [[ $N =~ $decimal_expr ]] ; then
echo "error: Not a number" >&2;
exit 1
fi
```

* Regex: 
    * ^, això fixa l'expressió a l'inici d'una línia.
    * [0-9]+, això coincideix amb almenys un caràcter del conjunt 0-9 -> 1 o més caràcters del rang 0-9.
    * .+, això coincideix com a mínim amb un caràcter de qualsevol tipus.
    * [0-9], coincideix amb un sol dígit.
    * ?, assegura 0 o 1 de l'expressió anterior.
    * $, això fixa l'expressió al final de la línia.

Per testejar si una variable compleix un expressió regular podeu fer: [[ var = regex ]].

```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh 22.4
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh 2.4
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh 1112.4
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh 11.44335435353
```

---

El problema d'aquesta expressió regular és que no té en compte les expressions amb signe.  **Activitat 05**: Modificar-la per tenir en compte els signes. 

```shell
root@os-102377-i-2122-debian-lab:~/resources/HandsOn07/fabrica# ./check_args.sh -11.44335435353
Error: No s un nombre decimal!
```

---

**Activitat 06**: Completar el script següent de manera que que si no li passem cap argument a la funció imprimeixi el seu PID amb la data i si li passem un argument imprimeixi aquest argument amb la data.

```bash
#!/bin/bash
check_proc(){
if [ condition]
then
else
fi
}
check_proc
check_proc "1"
```

```shell
[28239] dijous, 9 de desembre de 2021, 11:43:53 CET
[1] dijous, 9 de desembre de 2021, 11:43:53 CET
```

---

**Activitat 07:** Explicar detalladament que fa el script següent:

```bash
#!/bin/bash

N=$1
complete=0
fail=0
echo "Hi, I am the factory [$$]..."
pids=""
for ((i=0;i<N;i++))
do
    # Donar a p.sh permissos d'execució abans d'executar.
    ( ./p.sh ) &
    sleep 3
    pids+=" $!"
    echo "Hi, the factory creates: $pids..."
done
for p in $pids; do
    if wait $p; then
    (( complete++ ))
    else
    (( fail++ ))
    fi
done
echo "$complete processes completed successfully."
echo "$fail processes failed to completed."
echo "Done."
```

```shell
#!/bin/bash
echo "RUN - time: $(date) Process id:$$"
sleep $((RANDOM % 21))
echo "END - time:$(date) Process id:$$"
```

---

 **Activitat 08**:  Modificar *act07.sh* per utilitzar un array on es guardin els pids dels processos que es van generant.  

---

**Activitat 09**: Heu d'entregar un script que faci:

1. Comprovi que no existeix un altre script amb el mateix nom i diferent pid executant-se.
2. Assegurar que l’usuari executi el script amb 2 arguments. L’argument 1 ha de ser el nombre de processos a generar. I l’argument 2 ha de ser el programa a recobrir (tota la ruta).
3. Cal verificar que argument 1 és un enter més gran que 0.
4. Cal verificar que argument 2 existeix com a fitxer regular.
5. Si l’argument 2 no té permisos d’execució, se li atorgaran.
6. Es mostrarà un menú a la pantalla, on: 
* Opció 1: executarà la fàbrica de processos amb els arguments rebuts.
* Opció 2:  eliminarà l’executable passat com a paràmetre.
* Opció 3:  traurà els permisos d’execució de l’argument 2.

---

**Activitat 10**: Si executeu aquest script, observareu que el script no realitza la suma de forma correcta. Expliqueu quin és el problema i proposeu una solució.

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

---