# ================================================================
# CONFIGURACIÓN BÁSICA DE TERRAFORM Y PROVEEDOR AWS
# ================================================================
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" 
      version = ">= 2.0"             
    }
  }
}

provider "aws" {
  region = "us-east-1"         
}

# ================================================================
# SECURITY GROUP (Firewall de red)
# ================================================================
resource "aws_security_group" "accesoservicios" {
  name        = "accesoservicios"                     
  description = "Firewall web con SSH, HTTP y HTTPS"       

  # --------------------------------------------------------------
  # Reglas de ENTRADA (ingress): tráfico que entra al servidor
  # --------------------------------------------------------------
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"          
    cidr_blocks = ["0.0.0.0/0"]     
  }

  # --------------------------------------------------------------
  # Reglas de SALIDA (egress): tráfico que sale del servidor
  # --------------------------------------------------------------

  egress {
    description = "Permitir salida HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   
  }

  egress {
    description = "Permitir salida HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    
  }

  tags = {
    Name = "firewall_web_seguro"   
  }
}

# ================================================================
# INSTANCIA EC2 
# ================================================================
resource "aws_instance" "miserver" {
  ami                    = "ami-0360c520857e3138f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.accesoservicios.id]

  user_data = <<-EOF
  #!/bin/bash
  set -e

  apt-get update -y
  apt-get install -y nginx git

  rm -rf /var/www/html/*
  git clone https://github.com/Pythagoras001/ProyectoVistasHTML_CSS.git /tmp/proyecto

  cp -r /tmp/proyecto/docs/* /var/www/html/
  chown -R www-data:www-data /var/www/html
  chmod -R 755 /var/www/html
  rm -f /var/www/html/index.nginx-debian.html
  systemctl enable nginx
  systemctl restart nginx

  EOF

  tags = { Name = "ServidorWeb" }
}
