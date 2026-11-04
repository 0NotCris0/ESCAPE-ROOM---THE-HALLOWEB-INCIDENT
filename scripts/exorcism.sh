#!/bin/bash

CSV="data/ghost_hosts.csv"

if [ ! -f "$CSV" ]; then
    echo "ERROR: No existe el archivo CSV"
    exit 1
fi

echo "Iniciando analisis de amenazas..."

while IFS=, read -r host ip nivel estado puerto
do
    if [ "$estado" = "Infectado" ]; then

        case "$puerto" in
            22|3389|445)
                echo "AISLAMIENTO SIMULADO: $host ($ip), puerto $puerto"
                ;;
            *)
                echo "Puerto no critico descartado: $puerto"
                ;;
        esac

=======
while IFS=, read -r host ip nivel estado
do
    if [ "$estado" = "Infectado" ]; then
        echo "AISLAMIENTO SIMULADO: $host ($ip)"

    fi
done < <(tail -n +2 "$CSV")