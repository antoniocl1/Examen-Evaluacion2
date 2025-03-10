provider "aws" {
  region = var.region
}

# Crear el grupo de seguridad: grupo_seguridad_ejercicio_2
resource "aws_security_group" "grupo_seguridad_ejercicio_2" {
  name        = "grupo_seguridad_ejercicio_2"
  description = var.sg_description

  # Reglas de entrada
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Reglas de salida
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Crear la instancia EC2: instancia_ejercicio_2
resource "aws_instance" "instancia_ejercicio_2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  # Configurar el almacenamiento
  root_block_device {
    volume_size = 30
  }

  vpc_security_group_ids = [aws_security_group.grupo_seguridad_ejercicio_2.id]

  tags = {
    Name = "instancia_ejercicio_2"
  }
}
