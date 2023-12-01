
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.virtual_machines

  name                  = each.key
  resource_group_name   = var.resource_group_name
  location              = azurerm_resource_group.rg[each.key].location
  vm_size               = each.value.size
  admin_username        = "rodriguiti"
  network_interface_ids = [each.value.id]

  admin_password                  = "rodriguiti123!"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
