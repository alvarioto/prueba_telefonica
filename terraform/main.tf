# Obtén acceso al registry de origen
resource "azurerm_container_registry" "source_registry" {
  name                = var.source_registry
  resource_group_name = var.resource_group_name
  location            = "East US" # Cambia esta ubicación según tus necesidades
  sku                 = "Basic"
  admin_enabled       = true
}

# Obtén acceso al registry de destino
resource "azurerm_container_registry" "destination_registry" {
  name                = var.destination_registry
  resource_group_name = var.resource_group_name
  location            = "East US" # Cambia esta ubicación según tus necesidades
  sku                 = "Basic"
  admin_enabled       = true
}

# Copiar los charts entre registries usando el az cli
resource "null_resource" "copy_helm_chart" {
  provisioner "local-exec" {
    command = <<EOT
      # Log in to source registry
      az acr login --name ${azurerm_container_registry.source_registry.name}
      
      # Log in to destination registry
      az acr login --name ${azurerm_container_registry.destination_registry.name}
      
      # Copia los charts. Reemplaza 'chart_name' con el nombre real del chart que quieres copiar.
      az acr helm push ${azurerm_container_registry.source_registry.name} chart_name --destination ${azurerm_container_registry.destination_registry.name}
    EOT
  }

  depends_on = [
    azurerm_container_registry.source_registry,
    azurerm_container_registry.destination_registry
  ]
}




