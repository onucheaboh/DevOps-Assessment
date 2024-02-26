variable "azure_region" {
  description = "Azure region where resources will be deployed"
  default     = "East US"
}

variable "aks_node_count" {
  description = "Number of nodes in the AKS cluster"
  default     = 2
}

variable "aks_node_size" {
  description = "Size of each AKS node"
  default     = "Standard_DS2_v2"
}

variable "sql_db_sku" {
  description = "Azure SQL Database SKU"
  default     = "Basic"
}

variable "sql_db_size" {
  description = "Azure SQL Database size"
  default     = "5GB"
}
