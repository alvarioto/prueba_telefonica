# prueba_telefonica

# Resumen del DevOps Engineer Code Challenge

## Challenge 1: Modificación del Helm Chart

- **Node Groups Aislados:** 
  Usamos *node selectors* y *taints & tolerations* para evitar que los pods se desplieguen en nodos no deseados.

- **Evitar Pods Duplicados en un Nodo:**
  Implementamos *podAntiAffinity* para asegurarnos de que no haya dos pods del mismo tipo en el mismo nodo.

- **Distribución en Zonas de Disponibilidad:**
  Configuramos *topology spread constraints* para distribuir los pods en diferentes zonas de disponibilidad.

- **Script Aleatorio en Cada Actualización:**
  Añadimos un *hook* que ejecuta un script aleatorio cada vez que se actualiza el Helm chart.

## Challenge 2: Automatización con Terraform para Copiar Helm Charts

- **Automatización con Terraform:**
  Usamos Terraform para automatizar la copia de Helm charts entre registros ACR.

- **Autenticación en Azure:**
  Implementamos un *service principal* para gestionar las credenciales necesarias en Azure y automatizar el proceso.

- **Uso de Data Sources:**
  Utilizamos *data sources* en Terraform para obtener información del ACR de origen y destino.

- **Despliegue en AKS:**
  Terraform se encarga de gestionar la copia del chart y su despliegue automático en AKS usando Helm.

## Challenge 3: GitHub Actions para Automatización del Despliegue

- **Pipeline en GitHub Actions:**
  Creamos un flujo de trabajo en GitHub Actions que automatiza todo el proceso de despliegue del Helm chart.

- **Credenciales Seguras:**
  Las credenciales de Azure se almacenaron como *secretos* en GitHub para asegurar la autenticidad y seguridad.

- **Despliegue Completo:**
  El pipeline ejecuta Terraform para copiar los charts, y luego Helm para instalarlos en el clúster AKS, todo de manera automática.

