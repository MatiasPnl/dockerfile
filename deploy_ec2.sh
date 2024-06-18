#!/bin/bash

AWS_REGION="us-east-1"
KEY_PAIR_NAME="tu-par-clave"
SECURITY_GROUP_ID="tu-grupo-seguridad"
IMAGE_ID="ami-12345678" 


INSTANCE_ID=$(aws ec2 run-instances \
    --image-id $IMAGE_ID \
    --count 1 \
    --instance-type t2.micro \
    --key-name $KEY_PAIR_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --region $AWS_REGION \
    --query 'Instances[0].InstanceId' \
    --output text)

echo "Instancia creada con ID: $INSTANCE_ID"

aws ec2 wait instance-running --instance-ids $INSTANCE_ID --region $AWS_REGION

INSTANCE_PUBLIC_IP=$(aws ec2 describe-instances \
    --instance-ids $INSTANCE_ID \
    --query 'Reservations[0].Instances[0].PublicIpAddress' \
    --output text \
    --region $AWS_REGION)

echo "La instancia está en ejecución en la IP: $INSTANCE_PUBLIC_IP"

echo "Esperando a que la instancia esté lista..."
sleep 60

ssh -i "ruta/a/tu/par-clave.pem" ec2-user@$INSTANCE_PUBLIC_IP << EOF
    sudo yum update -y
    sudo amazon-linux-extras install docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo docker pull $DOCKER_USERNAME/mi_proyecto_flask:latest
    sudo docker run -d -p 80:5000 $DOCKER_USERNAME/mi_proyecto_flask:latest
EOF

echo "Despliegue completado. La aplicación está disponible en http://$INSTANCE_PUBLIC_IP"