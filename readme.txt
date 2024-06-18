## Requisitos

- Python 3.x
- Docker
- Docker Compose (opcional, si quieres usarlo para simplificar el manejo de múltiples servicios)

## Configuración del Proyecto Flask

1. Clona el repositorio:

    ```bash
    git clone https://github.com/tu-usuario/MatiasPnl/dockerfile
    cd tu-repositorio
    ```

2. Crea y activa un entorno virtual:

    En PowerShell:

    ```bash
    python -m venv venv
    .\venv\Scripts\Activate
    ```

    En el Símbolo del Sistema (cmd):

    ```bash
    python -m venv venv
    venv\Scripts\activate
    ```

3. Instala las dependencias:

    ```bash
    pip install -r requirements.txt
    ```

## Construcción y Ejecución con Docker

1. Construye la imagen de Docker:

    ```bash
    docker build -t mi_proyecto_flask .
    ```

2. Ejecuta el contenedor:

    ```bash
    docker run -p 5000:5000 mi_proyecto_flask
    ```

3. Abre tu navegador y visita `http://localhost:5000` para ver la aplicación en acción.

## Script de Configuración del Contenedor MySQL

Este script descarga una imagen de MySQL, compila un contenedor con un nombre y tag personalizado, instala paquetes dentro del contenedor y ejecuta uno de ellos.

1. Dar permisos de ejecución al script (solo necesario en sistemas basados en Unix):

    ```bash
    chmod +x setup_container.sh
    ```

2. Ejecutar el script:

    ```bash
    ./setup_container.sh
    ```

## Archivos del Proyecto

- `app.py`: Archivo principal de la aplicación Flask.
- `requirements.txt`: Lista de dependencias de Python.
- `Dockerfile`: Instrucciones para construir la imagen Docker.
- `setup_container.sh`: Script para configurar y ejecutar un contenedor MySQL.

