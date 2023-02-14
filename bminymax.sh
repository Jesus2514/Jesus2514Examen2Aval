#!/bin/bash


cat consumo.txt | awk 'BEGIN' { max=0; min=999999 }
{ 
  
  ciudad=$1; mes=$2; anio=$3; consumo=$4;

  
  if (consumo > max) {
    max=consumo; max_ciudad=ciudad; max_mes=mes; max_anio=anio;
  }
  if (consumo < min) {
    min=consumo; min_ciudad=ciudad; min_mes=mes; min_anio=anio;
  }
} 
END { 
  printf "El consumo máximo fue %d en %s %s %d\n", max, max_ciudad, max_mes, max_anio;
  printf "El consumo mínimo fue %d en %s %s %d\n", min, min_ciudad, min_mes, min_anio;
}
