#!/bin/sh

if [ "$#" -eq "2" ]
then
csvgrep -d '^' -c nb_engines -m $1 $2|tail -n +2|wc -l
else 
echo "ERROR: Usage: ./ejercicio2_20151115.sh <num_engines> <aircraft_file.csv>"
fi
