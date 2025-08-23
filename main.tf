resource "azurerm_resource_group" "RG1" {
  name     = "sho-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "STG" {
  name                     = "shostg"
  resource_group_name      = azurerm_resource_group.RG1.name
  location                 = azurerm_resource_group.RG1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_resource_group" "RG2" {
  name     = "sho1-rg"
  location = "West Europe"
}
