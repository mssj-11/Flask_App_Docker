#!/bin/bash

function stop_angular() {
    echo "Deteniendo Proyecto Angular..."
    docker stop ucontainer-angular
}

function run_tests() {
    echo "Ejecutando tests con Selenium y Mocha..."
    # docker start ucontainer-angular
    docker exec -it ucontainer-angular bash -c "
        cd crud-personas && 
        npm run test"
}

function run_test_cucumber() {
    echo "Ejecutando tests con CUCUMBER..."
    docker exec -it ucontainer-angular bash -c "
        cd crud-personas && 
        npm run test:cucumber"
}

while true; do
    clear
    echo "===== Menú de Opciones ====="
    echo "1) Ejecutar Tests (Selenium + Mocha)"
    echo "2) Ejecutar Tests (CUCUMBER)"
    echo "3) Detener Contenedor Angular"
    echo "4) Salir"
    echo "==========================="
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1) run_tests ;;
        2) run_test_cucumber ;;
        3) stop_angular ;;
        4) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción inválida, intente de nuevo." ;;
    esac
    sleep 2
done
