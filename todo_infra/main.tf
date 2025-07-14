module "resource_group" {
  source                  = "../modules/azurerm_resource_group"
  resource_group_name     = "rg-todoapp_cs"
  resource_group_location = "centralindia"
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../modules/azurerm_virtual_network"

  virtual_network_name     = "vnet-todoapp_cs"
  virtual_network_location = "centralindia"
  resource_group_name      = "rg-todoapp_cs"
  address_space            = ["10.0.0.0/16"]
}

# Dard1 - Backend subnet and frontend subnet do baar repeat ho raha hai...
module "frontend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"

  resource_group_name  = "rg-todoapp_cs"
  azurerm_virtual_network_name = "vnet-todoapp_cs"
  subnet_name          = "frontend-subnet_cs"
  address_prefixes     = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"

  resource_group_name  = "rg-todoapp_cs"
 azurerm_virtual_network_name = "vnet-todoapp_cs"
  subnet_name          = "backend-subnet_cs"
  address_prefixes     = ["10.0.4.0/24"]
