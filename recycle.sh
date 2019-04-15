#!/bin/bash

while getopts 'c:r:e' d
do
    case $d in
        c) rmfile="$OPTARG" ;;
        r) restore=$OPTARG ;;
        e) empty;;
    esac
done



if [ "$rmfile" ]; then
    mv $2 /Users/Tom/Development/M3/recycleBin/trash
fi

if [ "$restore" ]; then


