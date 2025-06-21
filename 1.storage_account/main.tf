terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.9.0"
}

provider "azurerm" {
  features {

  }
  subscription_id = "your-subscription-id" # Replace with your Azure subscription ID
}

resource "azurerm_resource_group" "example" {
  name     = "example-resourcesing"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccount86775456" # Must be globally unique
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location #implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
