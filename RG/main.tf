provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
    for_each              =   var.resource_group
    name                  =   each.key
    location              =   each.value
    tags                  =   var.tags
}