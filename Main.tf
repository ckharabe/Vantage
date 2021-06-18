provider "azurerm" {
  features{}
}
module "rg" {

  
  source = "./rg"
   
}
module "network" {
  
    source = "./network"

resource_group_name = var.resource_group_name
resource_group_name2 = var.resource_group_name2    
}   

