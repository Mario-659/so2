#!/bin/bash

if [ "$#" != "2" ]; then
	echo "Skrypt powinien byc uruchamiany z dwoma argumentami"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "Nie istnieje taki katalog"
	exit 1
fi

if [ ! "$(ls $1/*.$2)" ]; then
	echo "Nie ma plikow o rozszerzeniu $2 w katalogu $1"
	exit 1
fi

rm $1/nowy_plik.$2 2> /dev/null

for file in `ls $1/*.$2`; do
	echo "$file" >> $1/nowy_plik.$2
	cat $file >> $1/nowy_plik.$2
done
