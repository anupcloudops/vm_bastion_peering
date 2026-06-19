data "azurerm_network_interface" "dni" {
   for_each = var.associations
   name = each.value.netname
   resource_group_name = each.value.rgname
}
data "azurerm_network_security_group" "dnsg" {
   for_each = var.associations
   name = each.value.nsgname
   resource_group_name = each.value.rgname
}