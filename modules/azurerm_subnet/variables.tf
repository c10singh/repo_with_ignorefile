variable "subnet_name" {
  description = "name of subnet"
  type = string
}
variable "resource_group_name" {
description = "name of resource group"
type =string  
}
variable "azurerm_virtual_network_name" {
  description = "name of virtual network"
  type = string
}
variable "address_prefixes" {
  description = "address perfixes"
  type = list(string)
}