data "azurerm_network_interface" "dni" {
   for_each = var.vms
   name = each.value.netname
   resource_group_name = each.value.rgname
}