terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate27595"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
