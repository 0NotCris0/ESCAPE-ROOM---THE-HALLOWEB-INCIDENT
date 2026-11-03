#!/bin/bash

CSV="data/ghost_hosts.csv"

if [ ! -f "$CSV" ]; then
    echo "ERROR: No existe el archivo CSV"
    exit 1
fi

echo "Iniciando analisis de amenazas..."

while IFS=, read -r host ip nivel estado
do
    if [ "$estado" = "Infectado" ]; then
        echo "AISLAMIENTO SIMULADO: $host ($ip)"
    fi
done < <(tail -n +2 "$CSV")