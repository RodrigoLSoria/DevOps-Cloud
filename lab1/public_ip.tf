
resource "azurerm_public_ip" "pip" {
  for_each = {
    for vm_name, vm_details in var.virtual_machines :
    vm_name => vm_details
    if contains(["rg-ro1", "rg-ro3"], vm_details.resource_group_name)
  }

  name                = "pip-${each.key}"
  resource_group_name = each.value.resource_group_name
  location            = azurerm_resource_group.rg[each.value.resource_group_name].location
  allocation_method   = "Static"
  // Add other configurations if needed
}