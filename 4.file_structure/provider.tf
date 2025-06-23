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
  subscription_id = "replace-with-your-subscription-id" # Replace with your Azure subscription ID
}
