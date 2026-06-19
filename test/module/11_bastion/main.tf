resource "azurerm_bastion_host" "bastionblock" {
    for_each = var.bastions
    name = each.value.name
    resource_group_name = each.value.rgname
    location = each.value.location
    ip_configuration {
        name = each.value.bicname
        subnet_id = data.azurerm_subnet.ddsub[each.key].id
        public_ip_address_id = data.azurerm_public_ip.ddpip[each.key].id
    }
}