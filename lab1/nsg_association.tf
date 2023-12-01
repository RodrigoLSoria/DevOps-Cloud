
resource "azurerm_subnet_network_security_group_association" "nsg-association" {
  for_each = var.nsgs

  subnet_id                 = each.value.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id

}
