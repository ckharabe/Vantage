variable "resource_group" {
    description     =       "Create multiple resource groups"
    type            =       map(string)
    default         =       {
        "TransitRG"        =       "West Europe"
        "BastionRG"        =       "West Europe"
        "LogRG"            =       "West Europe"
    }
}
variable "tags" {
  description = "Creating Tags"
  type = map(string)
  default = {
    "environment" = "dev"
  }
}