#!/bin/bash

while getopts 'c:r:eif' d
do
    case $d in
        c) rmfile="$OPTARG" ;;
        r) restore=$OPTARG ;;
        e) empty=true ;;
        i) interactive=true ;;
        f) force=true ;;
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
    mv  $2 $location
fi

if [ "$empty" ]; then
    find ~/trash/ -mindepth 1 -delete
fi

if [ "$interactive" ]; then
    echo "Are you sure you want to move to the trash (Yes|No)"
    read ans
    if [ $ans == "yes" ] || [ $ans == "y" ]; then
         if [ ! -d "$trashpath" ]; then
             mkdir -p $trashpath
             chmod ugo+rwx $trashpath
         fi
         mv $2 $trashpath
    fi
fi


if [ "$force" ]; then
    chmod +x $2
fi
