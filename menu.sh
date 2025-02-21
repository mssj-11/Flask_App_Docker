#!/bin/bash

function flask_project() {
    echo "Iniciando Proyecto Flask..."
    docker start ubuntu-container
    docker exec -it ubuntu-container bash -c "
        source venv/bin/activate &&
        python app.py"
}

function stop_flask() {
    echo "Deteniendo Proyecto Flask..."
    docker stop ubuntu-container
}

function angular_project() {
    echo "Iniciando Proyecto Angular..."
    docker start ucontainer-angular
    docker exec -it ucontainer-angular bash -c "
        cd crud-personas &&
        ng serve --host 0.0.0.0"
}

function stop_angular() {
    echo "Deteniendo Proyecto Angular..."
    docker stop ucontainer-angular
}

while true; do
    clear
    echo "===== Menú de Opciones ====="
    echo "1) Iniciar Proyecto Flask"
    echo "2) Detener Proyecto Flask"
    echo "3) Iniciar Proyecto Angular"
    echo "4) Detener Proyecto Angular"
    echo "5) Salir"
    echo "==========================="
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1) flask_project ;;
        2) stop_flask ;;
        3) angular_project ;;
        4) stop_angular ;;
        5) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción inválida, intente de nuevo." ;;
    esac
    sleep 2
done
