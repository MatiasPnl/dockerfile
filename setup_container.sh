IMAGE_NAME="mysql:latest"
CONTAINER_NAME="mi_mysql"
MYSQL_ROOT_PASSWORD="mipassword"

echo "Descargando la imagen $IMAGE_NAME..."
docker pull $IMAGE_NAME

echo "Compilando el contenedor con el nombre $CONTAINER_NAME..."
docker run -d --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD $IMAGE_NAME

echo "Instalando paquetes dentro del contenedor..."
docker exec -it $CONTAINER_NAME bash -c "apt-get update && apt-get install -y cmatrix htop"

echo "Ejecutando cmatrix dentro del contenedor..."
docker exec -it $CONTAINER_NAME cmatrix


echo "Script completado."