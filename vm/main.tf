resource "azurerm_resource_group" "eu-rg" {
  name     = "${var.prefix}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "eu-vnet" {
  name                = "${var.prefix}-network"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.eu-rg.location
  resource_group_name = azurerm_resource_group.eu-rg.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.eu-rg.name
  virtual_network_name = azurerm_virtual_network.eu-vnet.name
  address_prefixes     = ["10.10.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.eu-rg.location
  resource_group_name = azurerm_resource_group.eu-rg.name

  ip_configuration {
    name                          = "dev-configuration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "eu-vms" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.eu-rg.location
  resource_group_name   = azurerm_resource_group.eu-rg.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Comment the line below to not to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "eu-node1"
    admin_username = "default_admin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "dev"
  }
}