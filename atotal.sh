#!/bin/bash

echo "Introduce el nombre de la ciudad"
read ciudad

while true; do
  case $ciudad in
    Valencia)
      consumo=$(awk '/Valencia/ {sum+=$3} END {print sum}' consumo.txt)
      echo "El consumo total de $ciudad es: $consumo"
      break
      ;;
    Barcelona)
      consumo=$(awk '/Barcelona/ {sum+=$3} END {print sum}' consumo.txt)
      echo "El consumo total de $ciudad es: $consumo"
      break
      ;;
    Madrid)
      consumo=$(awk '/Madrid/ {sum+=$3} END {print sum}' consumo.txt)
      echo "El consumo total de $ciudad es: $consumo"
      break
      ;;
    *)
      echo "Ciudad no encontrada. Introduce una ciudad válida: "
      read ciudad
      ;;
  esac
done
