locals {
  subnet_ids = { for vm in var.virtual_machines : vm => contains(["rg-ro1", "rg-ro3"], vm.resource_group_name) ? var.public_subnet_id : var.private_subnet_id }
}

resource "azurerm_network_interface" "nic" {
  for_each = var.virtual_machines

  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig${each.key}"
    subnet_id                     = local.subnet_ids[each.key]
    private_ip_address_allocation = "Dynamic"
  }
}
