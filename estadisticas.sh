#!/bin/bash

cantX=`cat 3raya.log | grep X | wc -l`
cantO=`cat 3raya.log | grep O | wc -l`
cantTotal=`cat 3raya.log | wc -l`

porcenX=$((cantX * 100 / cantTotal))
porcenO=$((cantO * 100 / cantTotal))

echo "=============================================" 

echo "----------------ESTADÍSTICAS----------------" 

echo "=============================================" 
echo ""


echo "CANTIDAD DE VICTORIAS JUGADOR X: $cantX "
echo "CANTIDAD DE VICTORIAS JUGADOR O: $cantO "

echo ""


echo "PORCENTAJE DE VICTORIAS JUGADOR X: $porcenX %"
echo "PORCENTAJE DE VICTORIAS JUGADOR O: $porcenO %"

echo ""

echo "El modo fiesta no tiene estadísticas disponibles."
