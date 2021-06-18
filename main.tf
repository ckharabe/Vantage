provider "azurerm" {
client_id = "6d41da4e-773b-4a87-a599-69b30e68317d"
client_secret = "p~We1._-8Nv520.oRL0MiPurP4PTVqw6MM"
subscription_id = "cfde4035-44d8-4bee-a995-eb9199a8a2c1"
tenant_id = "c7183232-e1e7-424d-9b37-ab787c4a6c0c"
features {}
}

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
