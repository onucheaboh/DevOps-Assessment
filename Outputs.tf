output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.my_cluster.name
}

output "sql_server_name" {
  value = azurerm_sql_server.my_sql_server.name
}

output "sql_database_name" {
  value = azurerm_sql_database.my_sql_databse.name
}
