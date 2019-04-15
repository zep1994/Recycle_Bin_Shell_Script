#!/bin/bash

while getopts 'c:r:e' d
do
    case $d in
        c) rmfile="$OPTARG" ;;
        r) restore=$OPTARG ;;
        e) empty;;
    esac
done

trashpath=~/trash/

if [ ! -d "$trashpath" ]; then
     mkdir -p $trashpath
     chmod ugo+rwx $trashpath
fi

if [ "$rmfile" ]; then
    if [ ! -d "$trashpath" ]; then
	mkdir -p $trashpath
    chmod ugo+rwx $trashpath
fi
    mv $2 $trashpath
fi

if [ "$restore" ]; then
    echo "Where would you like to save this file?"
    read location
    mv -i $filename $location/$filename

fi
