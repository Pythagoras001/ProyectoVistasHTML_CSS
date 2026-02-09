# Startup Software Solutions – Web Template

## Descripción

Este proyecto es una plantilla web basada en vistas descargadas de W3Layouts, donde todo el contenido original fue reemplazado por una temática propia.

La temática corresponde a una empresa startup de tecnología que ofrece los siguientes servicios:

- Desarrollo de software
- Desarrollo web
- Servicios cloud
- Ciberseguridad

Además de la parte visual, el proyecto incluye un apartado básico de manifiestos en Terraform para realizar el despliegue de infraestructura en AWS, como una introducción al uso de infraestructura como código.

Este proyecto fue realizado con fines académicos y de aprendizaje.

---

## Tecnologías usadas

### Frontend
- HTML5  
- CSS3  
- JavaScript  
- Plantillas base de W3Layouts

### Cloud / Infraestructura
- AWS (Amazon Web Services)
- Terraform
- AWS CLI

---

## Instrucciones de instalación / visualización

### 1. Clonar el repositorio
git clone https://github.com/Pythagoras001/ProyectoVistasHTML_CSS.git
cd ProyectoVistasHTML_CSS

### 2. Configurar credenciales de AWS
### (debes tener una cuenta de AWS previamente)
aws configure
Ingresar:
- AWS Access Key ID
- AWS Secret Access Key
- Región (ejemplo: us-east-1)
- Output format: json

### 3. Verificar que AWS CLI esté correctamente configurado
aws sts get-caller-identity

### 4. Ir al directorio donde están los manifiestos de Terraform
cd terraform

### 5. Inicializar Terraform
terraform init

### 6. Ver el plan de ejecución (opcional pero recomendado)
terraform plan

### 7. Aplicar la infraestructura en AWS
terraform apply

### 8. Confirmar escribiendo 'yes' cuando Terraform lo solicite
