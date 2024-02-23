resource "azurerm_resource_group" "main" {
  name     = var.eu_resource_group
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_euwest
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.eu_subnet1
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.eu_subnet1_prefix
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.eu_subnet2
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.eu_subnet2_prefix
}
