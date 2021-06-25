provider "azurerm" {
client_id = var.client_id
client_secret = var.client_secret
subscription_id = var.subscription_id
tenant_id = var.tenant_id

features {}
}

 resource "azurerm_resource_group" "storage" {
  name     = "Yogesh"
  location = "WestEurope"
}

module "management_groups" {
  source                              = "./Modules/storageaccount"
storage_account_name = var.storage_account_name
resource_group_name = var.resource_group_name
region = var.region
tier = var.tier
account_replication_type = var.account_replication_type
tags = var.tags

}
