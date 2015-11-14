#!/bin/sh

# Calcula el modelo de avion con mayor numero de motores
csvsort -d '^' -c nb_engines optd_aircraft.csv|cut -d ',' -f 3|tail -1
