terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "replace-with-your-storage-account-name" # Replace with your Azure Storage Account name after creating it
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
