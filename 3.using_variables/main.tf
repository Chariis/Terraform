terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "replace-with-your-storage-account-name" # Replace with your Azure Storage Account name after creating it
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

  required_version = ">= 1.9.0"
}

provider "azurerm" {
  features {

  }
  subscription_id = "replace-with-your-subscription-id" # Replace with your Azure subscription ID
}

variable "environment" {
  type        = string
  description = "the env type"
  default     = "staging"

}

locals {
  common_tags = {
    environment = "dev"
    lob         = "banking"
    stage       = "alpha"
  }
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
    environment = local.common_tags.environment
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}
