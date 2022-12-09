resource "azurerm_virtual_network" "wordpress" {
  name                = "wordpress-vnet"
  address_space       = var.cidr_block
  location            = var.location
  resource_group_name = azurerm_resource_group.wordpress.name
  tags                = {
    vVERSION = "v1.0.0" }

}

resource "azurerm_subnet" "wordpress" {
  name                 = "wordpress-subnet"
  resource_group_name  = azurerm_resource_group.wordpress.name
  virtual_network_name = azurerm_virtual_network.wordpress.name
  address_prefixes     = var.subnet_address
}

resource "azurerm_public_ip" "wordpress" {
  name                = "wordpress-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.wordpress.name
  allocation_method   = "Static"
  domain_name_label   = random_string.fqdn.result
  
}
