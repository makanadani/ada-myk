# Define a Virtual Network (VNet) e Subnet.
resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.environment_rg.location
  resource_group_name = azurerm_resource_group.environment_rg.name
  address_space       = [var.virtual_network_address_space]
}

resource "azurerm_subnet" "cluster_resources" {
  name                 = var.subnet_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  resource_group_name  = azurerm_resource_group.environment_rg.name
  address_prefixes     = [var.subnet_address_prefixes]
}

resource "azurerm_network_security_group" "network_security_group" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.environment_rg.location
  resource_group_name = azurerm_resource_group.environment_rg.name

  security_rule {
    name                       = "Allow-HTTPS"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  subnet_id                 = azurerm_subnet.cluster_resources.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}