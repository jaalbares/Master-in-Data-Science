#!/bin/sh

# Calcula el modelo de avion con mayor numero de motores
csvsort -d '^' -c nb_engines $1|cut -d ',' -f 3|tail -1
