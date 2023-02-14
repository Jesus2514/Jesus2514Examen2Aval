#!/bin/bash


declare -A consumos


while read -r ciudad mes anyo consumo; do

  if [ "$anyo" = "2022" ]; then
    clave="$ciudad-$mes"
    consumos["$clave"]=$consumo
  fi
done < consumo.txt


for ciudad in "${!consumos[@]}"; do

  # Extraemos la ciudad y el mes
  ciudad_nom=$(echo "$ciudad" | cut -d '-' -f 1)
  mes=$(echo "$ciudad" | cut -d '-' -f 2)
  

  if [ "$mes" != "Enero" ]; then
    mes_anterior=$(echo "$mes" | awk '{
        if ($1 == "Febrero") print "Enero";
        else if ($1 == "Marzo") print "Febrero";
        else if ($1 == "Abril") print "Marzo";
        else if ($1 == "Mayo") print "Abril";
        else if ($1 == "Junio") print "Mayo";
        else if ($1 == "Julio") print "Junio";
    }')
    clave_anterior="$ciudad_nom-$mes_anterior"
    clave_actual="$ciudad_nom-$mes"
    consumo_anterior=${consumos[$clave_anterior]}
    consumo_actual=${consumos[$clave_actual]}
    
    if (( $consumo_actual < $consumo_anterior )); then
      echo "El consumo de $ciudad_nom ha sido decreciente en $mes"
    fi
  fi
done
