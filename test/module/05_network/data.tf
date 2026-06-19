data "azurerm_subnet" "dsub" {
    for_each = var.nets
    name = each.value.subnetname
    virtual_network_name = each.value.vnetname
    resource_group_name = each.value.rgname
}

