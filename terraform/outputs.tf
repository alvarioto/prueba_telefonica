output "source_registry" {
  description = "El nombre del registro de contenedores de origen"
  value       = azurerm_container_registry.source_registry.name
}

output "destination_registry" {
  description = "El nombre del registro de contenedores de destino"
  value       = azurerm_container_registry.destination_registry.name
}
