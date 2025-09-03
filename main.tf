resource "azurerm_resource_group" "RG1" {
  name     = "sho-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "STG" {
  depends_on = [ azurerm_resource_group.RG1 ]
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


resource "azurerm_virtual_network" "vnet" {
  depends_on = [ azurerm_resource_group.RG1 ]
  name                = "vnet1"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
  address_space       = ["10.0.0.0/16"]
  

}