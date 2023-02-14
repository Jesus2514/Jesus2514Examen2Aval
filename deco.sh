#!/bin/bash

read -p "Ingrese la ciudad para la que desea calcular la media de consumo: " ciudad


consumo_total=0
num_meses=0


while read linea; do
  
  ciudad_linea=$(echo "$linea" | awk '{print $1}')
  mes=$(echo "$linea" | awk '{print $2}')
  anio=$(echo "$linea" | awk '{print $3}')
  consumo=$(echo "$linea" | awk '{print $4}')

  
  if [ "$ciudad_linea" = "$ciudad" ]; then
    consumo_total=$((consumo_total + consumo))
    num_meses=$((num_meses + 1))
  fi

done < consumo.txt


if [ $num_meses -eq 0 ]; then
  echo "No se encontraron datos para la ciudad especificada."
else
  media=$(echo "scale=2; $consumo_total / $num_meses" | bc)

  if [ $(echo "$media < 400" | bc -l) -eq 1 ]; then
    echo "La ciudad de $ciudad tiene una calificación ECO."
  else
    echo "La ciudad de $ciudad no tiene una calificación ECO."
  fi
fi
