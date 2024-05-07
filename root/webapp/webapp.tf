# Fetch existing resource group
data "azurerm_resource_group" "existing" {
  name = "kml_rg_main-1af3390391a94b8a"
}

# Create Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "vnet1af3390391a94b8a"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
}

# Create Subnet within Virtual Network
resource "azurerm_subnet" "internal" {
  name                 = "subnet1af3390391a94b8a"
  resource_group_name  = data.azurerm_resource_group.existing.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create App Service Plan
resource "azurerm_app_service_plan" "slotDemo" {
  name                = "plan1af3390391a94b8a"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

# Create App Service within VNet
resource "azurerm_app_service" "slotDemo" {
  name                    = "appservice1af3390391a94b8a"
  location                = data.azurerm_resource_group.existing.location
  resource_group_name     = data.azurerm_resource_group.existing.name
  app_service_plan_id     = azurerm_app_service_plan.slotDemo.id
  app_settings = {
    "WEBSITE_VNET_ROUTE_ALL" = "1"
  }
}

# Create App Service Slot
#add the same code block to add more slots with slot2,3 in the name
resource "azurerm_app_service_slot" "slotDemo" {
  name                    = "slotone1af3390391a94b8a"
  location                = data.azurerm_resource_group.existing.location
  resource_group_name     = data.azurerm_resource_group.existing.name
  app_service_plan_id     = azurerm_app_service_plan.slotDemo.id
  app_service_name        = azurerm_app_service.slotDemo.name
}


