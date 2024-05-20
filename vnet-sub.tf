
data "azurerm_resource_group" "rg1" {
  name = "RG"
  

}

data "azurerm_virtual_network" "VN-01" {
  name                = "VN-01"
  resource_group_name = data.azurerm_resource_group.rg1.name
  
}

data "azurerm_subnet" "default" {
  name                 = "default"
  virtual_network_name = data.azurerm_virtual_network.VN-01.name
  resource_group_name  = data.azurerm_resource_group.rg1.name

}


resource "azurerm_subnet" "sub03" {
  name                 = "sub03"
  virtual_network_name = data.azurerm_virtual_network.VN-01.name
  resource_group_name  = data.azurerm_resource_group.rg1.name
  address_prefixes     = ["10.0.7.0/24"]
}