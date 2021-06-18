variable "resource_group_name" {
  description     =       "Virtual Network variables"
    type            =       string
  default = "Shreyesh"
}
variable "resource_group_name2" { 
  description     =       "Virtual Network variables"
    type            =      string
  default = "Chetan"
} 
# - VNET Variables

variable "virtual_network" {
    description     =       "Virtual Network variables"
    type            =       map(string)
    default         =       {
        "name"              =       "Transit-Vnet"
        "address_range"     =       "10.0.0.0/16"
    }
}


variable "virtual_network2" {
    description     =       "Virtual Network variables"
    type            =       map(string)
    default         =       {
        "name"              =       "Bastion-Vnet"
        "address_range"     =       "10.10.0.0/16"
    }
}
# - Subnet Variables

variable "subnet" {
    description     =       "Create multiple subnets"
    type            =       map(string)
    default         =       {
        "Subnet1"    =       "10.0.1.0/24"
        "Subnet2"    =       "10.0.2.0/24"
        "Subnet3"     =       "10.0.3.0/24"
        "GatewaySubnet"     =       "10.0.4.0/24"
    }
}

variable "subnet2" {
    description     =       "Create multiple subnets"
    type            =       map(string)
    default         =       {
        "test1"    =       "10.10.1.0/24"
        "test2"    =       "10.10.2.0/24"
        "Subnet3"     =       "10.10.3.0/24"
        "GatewaySubnet"     =       "10.10.4.0/24"
    }
}

variable "tags" {
  description = "Creating Tags"
  type = map(string)
  default = {
    "environment" = "dev"
  }
}
