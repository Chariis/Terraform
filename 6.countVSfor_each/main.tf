
resource "azurerm_resource_group" "example" {
  name     = "${var.environment}-resources"
  location = var.allowed_locations[2]
}

resource "azurerm_storage_account" "example" {
  #count = length(var.storage_account_name)
  for_each = var.storage_account_name
  #name = var.storage_account_name(count.index)
  name                     = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
