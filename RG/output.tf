output "resource-group" {
    description =   "Resource group name with location"
    value       =   { for i in azurerm_resource_group.rg: i.name => i.location }
}