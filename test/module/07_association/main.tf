resource "azurerm_network_interface_security_group_association" "association" {
    for_each = var.associations
    network_interface_id = data.azurerm_network_interface.dni[each.key].id
    network_security_group_id = data.azurerm_network_security_group.dnsg[each.key].id
}