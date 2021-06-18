 data "azurerm_resource_group" "RG1" {
 name = var.resource_group_name
 }

resource "azurerm_virtual_network" "vnet" {
  resource_group_name   =   data.azurerm_resource_group.RG1.name
  name                  =   var.virtual_network["name"]
  location              =   data.azurerm_resource_group.RG1.location
  address_space         =   [var.virtual_network["address_range"]]
  tags                  =   var.tags
}

 data "azurerm_resource_group" "RG2" {
 name = var.resource_group_name2
 }

resource "azurerm_virtual_network" "vnet2" {
  resource_group_name   =   data.azurerm_resource_group.RG2.name
  name                  =   var.virtual_network2["name"]
  location              =   data.azurerm_resource_group.RG2.location
  address_space         =   [var.virtual_network2["address_range"]]
  tags                  =   var.tags
}



#  Create multiple Subnets inside the virtual network

resource "azurerm_subnet" "sn" {
   for_each             =   var.subnet
   name                 =   each.key
   resource_group_name  =   data.azurerm_resource_group.RG1.name
   virtual_network_name =   azurerm_virtual_network.vnet.name
   address_prefixes     =   [each.value]
   
}

resource "azurerm_subnet" "sn2" {
   for_each             =   var.subnet2
   name                 =   each.key
   resource_group_name  =   data.azurerm_resource_group.RG2.name
   virtual_network_name =   azurerm_virtual_network.vnet2.name
   address_prefixes     =   [each.value]
   
}