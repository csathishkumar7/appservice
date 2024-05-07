output "resource_group_name" {
  value = data.azurerm_resource_group.existing.name
}

output "appservice_name" {
  value = azurerm_app_service.slotDemo.name
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "subnet_name" {
  value = azurerm_subnet.internal.name
}
