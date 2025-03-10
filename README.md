# examen-iaw-2-eval
Examen del dia 10/03/2025

# Ejercicio 1:

## Grupo de Seguridad
```bash
#!/bin/bash 
set -x 

# Deshabilitamos la paginación de la salida de los comandos de AWS CLI para evitar problemas con la ejecución de scripts
export AWS_PAGER=""

# Creamos el grupo de seguridad: backend-sg y le añadimos las reglas de acceso
aws ec2 create-security-group \
    --group-name grupo_seguridad_ejercicio_1 \
    --description "Para el examen"

# Creamos una regla de accesso SSH para el grupo de seguridad
aws ec2 authorize-security-group-ingress \
    --group-name grupo_seguridad_ejercicio_1 \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
```
![](capturas/ejercicio1/gruposeguridad.png)

## Instancia EC2
```bash
#!/bin/bash 
set -x

# Deshabilitamos la paginación de la salida de los comandos de AWS CLI para evitar problemas con la ejecución de scripts
export AWS_PAGER=""

# Creamos una intancia EC2 para el backend con las características indicadas
aws ec2 run-instances \
    --image-id ami-04b4f1a9cf54c11d0 \
    --count 1 \
    --instance-type t2.small \
    --key-name vockey \
    --security-groups grupo_seguridad_ejercicio1 \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=instancia_ejercicio_1}]" \
    --block-device-mappings "[{\"DeviceName\":\"/dev/sda1\",\"Ebs\":{\"VolumeSize\":20,\"DeleteOnTermination\":false}}]"
```
![](capturas/ejercicio1/instancialanzada.png)

# Ejercicio 2

## Terraform init
![](capturas/ejercicio2/terraforminit.png)

## Terraform validate
![](capturas/ejercicio2/terraformvalidate.png)

## Terraform plan
![](capturas/ejercicio2/terraformplan.png)

## Terraform apply
![](capturas/ejercicio2/terraformapply.png)

## Terraform show
![](capturas/ejercicio2/terraformshow.png)

# Ejercicio 3

## Comando de para ejecutar el playbook
```bash
ansible-playbook -i inventory/inventario main.yaml
```
![](capturas/ejercicio3/ejecucionansible.png)

# Ejercicio 4

## Ejecución de DockerFile
![](capturas/ejercicio3/dockerfile.png)

## Docker images para ver que se han creado correctamente los contenedores
Tengo 2, porque e primero que hice no llevaba el nombre del repo.
![](capturas/ejercicio3/dockerimages.png)

# Ejercicio 5
Primero hago login en docker con 
```bash
docker login -u antoniocl1
```
Ahora debemos introducir el token generado en Docker Hub, yo me he generado un token para este examen
![](capturas/ejercicio5publicar/token.png)