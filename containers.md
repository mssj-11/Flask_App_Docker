#   Ejecutar proyectos en los contenedores de forma individual



## Proyecto Flask
Para iniciar y ejecutar el proyecto Flask dentro del contenedor, sigue estos pasos:

1. Iniciar el contenedor:
```sh
docker start ubuntu-container
```

2. Acceder al contenedor:
```sh
docker exec -it ubuntu-container bash
```

3. Activar el entorno virtual:
```sh
source venv/bin/activate
```
4. Ejecutar la aplicación Flask:
```sh
python app.py
```

5. Para detener el contenedor después de su uso:
```sh
docker stop ubuntu-container
```





## Proyecto Angular
Para ejecutar el proyecto Angular dentro del contenedor, sigue estos pasos:

1. Iniciar el contenedor:
```sh
docker start ucontainer-angular
```

2. Acceder al contenedor:
```sh
docker exec -it ucontainer-angular bash
```

3. Navegar al directorio del proyecto:
```sh
cd crud-personas
```

4. Ejecutar el servidor Angular:
```sh
ng serve --host 0.0.0.0
```

5. Para detener el contenedor después de su uso:
```sh
docker stop ucontainer-angular
```