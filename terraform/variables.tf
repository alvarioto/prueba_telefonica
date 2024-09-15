variable "resource_group_name" {
  description = "Nombre del grupo de recursos donde se encuentra el AKS"
  type        = string
  default     = "my-resource-group"
}

variable "aks_name" {
  description = "Nombre del AKS"
  type        = string
  default     = "my-aks-cluster"
}

variable "source_registry" {
  description = "Nombre del registro de contenedores de origen (donde están los charts)"
  type        = string
  default     = "reference"
}

variable "destination_registry" {
  description = "Nombre del registro de contenedores de destino (donde se copian los charts)"
  type        = string
  default     = "instance"
}



