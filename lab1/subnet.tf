
resource "azurerm_subnet" "subnet1" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual-network.name
  address_prefixes     = each.value.address_prefixes
}

output "public_subnet_id" {
  value = azurerm_subnet.subnet1["public_subnet"].id
}

output "private_subnet_id" {
  value = azurerm_subnet.subnet1["private_subnet"].id
}