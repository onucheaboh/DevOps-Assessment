provider "azurerm" {
  features {}
}

# Create Azure Resource Group
resource "azurerm_resource_group" "my_assessment" {
  name     = "helm-repo"
  location = "East US"
}

# Create Azure Storage Account
resource "azurerm_storage_account" "my_assessment" {
  name                     = "assessmenthelmstorage"
  resource_group_name      = azurerm_resource_group.my_assessment.name
  location                 = azurerm_resource_group.my_assessment.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create Azure Storage Container
resource "azurerm_storage_container" "my_assessment" {
  name                  = "assessment-helm-charts"
  storage_account_name  = azurerm_storage_account.my_assessment.name
  container_access_type = "private"
}

# Upload Example Charts to Storage Container
resource "null_resource" "upload_charts" {
  depends_on = [azurerm_storage_container.my_assessment]

  provisioner "local-exec" {
    command = "helm package az storage blob upload-batch --destination ${azurerm_storage_container.my_assessment.name} --source . --account-name ${azurerm_storage_account.my_assessment.name} --account-key ${azurerm_storage_account.my_assessment.primary_access_key}"
  }
}
