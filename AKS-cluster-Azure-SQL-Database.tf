provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "assessment_resource_group" {
  name     = "aks-sql-resources"
  location = var.azure_region
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.assessment_resource_group.location
  resource_group_name = azurerm_resource_group.assessment_resource_group.name
}

resource "azurerm_kubernetes_cluster" "my_cluster" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.my_cluster.location
  resource_group_name = azurerm_resource_group.my_cluster.name
  dns_prefix          = "aks-cluster-dns"

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_node_size
  }

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.2.0.10"
    service_cidr   = "10.2.0.0/24"
    pod_cidr       = "10.244.0.0/16"
  }
  identity {
    type = "SystemAssigned"
  }
}

  resource "azurerm_sql_server" "my_sql_server" {
  name                         = "assessment-server"
  resource_group_name          = azurerm_resource_group.my_sql_server.name
  location                     = azurerm_resource_group.my_sql_server.location
  version                      = "12.0"
  administrator_login          = "admin"
  administrator_login_password = "Password456!"
}

resource "azurerm_sql_database" "my_sql_database" {
  name                = "assessment-db"
  resource_group_name = azurerm_resource_group.my_sql_database.name
  location            = azurerm_resource_group.my_sql_database.location
  server_name         = azurerm_sql_server.my_sql_database.name
  edition             = var.sql_db_sku
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb         = var.sql_db_size
}

  


