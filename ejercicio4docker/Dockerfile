FROM ubuntu:latest
LABEL author="AJCL"
LABEL description="Descripción para el exámen"

# Actualizar paquetes e instalar dependencias necesarias para clonar repositorios y nginx
RUN apt-get update && apt-get install -y \
    git \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Clonar el repositorio de la aplicación web estática
RUN git clone https://github.com/antoniocl1/PracticaMKdocs.git /tmp/practica_mkdocs

# Copiar el contenido del directorio "site" al directorio web de nginx
RUN cp -r /tmp/practica_mkdocs/site/* /var/www/html/

# Eliminar instalaciones previas
RUN rm -rf /tmp/practica_mkdocs

# Exponer el puerto 80 para acceder a nginx
EXPOSE 80

# Ejecuto nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
