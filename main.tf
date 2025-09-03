resource "azurerm_resource_group" "RG2" {
  name     = "sho1-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "STG" {
  depends_on = [ azurerm_resource_group.RG2 ]
  name                     = "shostg123"
  resource_group_name      = azurerm_resource_group.RG2.name
  location                 = azurerm_resource_group.RG2.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_resource_group" "RG3" {
  name     = "sho12-rg"
  location = "West Europe"
}


resource "azurerm_virtual_network" "vnet" {
  depends_on = [ azurerm_resource_group.RG2 ]
  name                = "vnet1"
  location            = azurerm_resource_group.RG2.location
  resource_group_name = azurerm_resource_group.RG2.name
  address_space       = ["10.0.0.0/16"]
  

}
