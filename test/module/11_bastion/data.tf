data "azurerm_subnet" "ddsub" {
    for_each = var.bastions
    name = each.value.subnetname
    virtual_network_name = each.value.vnetname
    resource_group_name = each.value.rgname
}
data "azurerm_public_ip" "ddpip" {
    for_each = var.bastions
    name = each.value.pipname
    resource_group_name = each.value.rgname
}