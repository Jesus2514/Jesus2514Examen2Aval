#!/bin/bash


media=$(./cmedia.sh)


ciudad=$(echo "$media" | awk '{print $5}')
media_consumo=$(echo "$media" | awk '{print $8}')


media_baja=$media_consumo
while read linea; do
  ciudad_linea=$(echo "$linea" | awk '{print $1}')
  consumo=$(echo "$linea" | awk '{print $4}')
  
  
  if [ "$ciudad_linea" = "$ciudad" ]; then
    media_ciudad=$(echo "scale=2; $consumo / $num_meses" | bc)
    if (( $(echo "$media_ciudad < $media_baja" | bc -l) )); then
      media_baja=$media_ciudad
    fi
  fi
done < consumo.txt


while read linea; do
  ciudad_linea=$(echo "$linea" | awk '{print $1}')
  consumo=$(echo "$linea" | awk '{print $4}')
  
  
  if [ "$ciudad_linea" = "$ciudad" ]; then
    media_ciudad=$(echo "scale=2; $consumo / $num_meses" | bc)
    if (( $(echo "$media_ciudad == $media_baja" | bc -l) )); then
      echo "La ciudad con la media de consumo más baja es: $ciudad"
      exit
    fi
  fi
done < consumo.txt

echo "No se encontraron datos para la ciudad especificada."
