resource "azurerm_network_security_group" "nsgblock" {
    for_each = var.nsgs
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.rgname
}
resource "azurerm_network_security_rule" "rule"{
  for_each = var.rule
    resource_group_name = each.value.rgname
    network_security_group_name = each.value.nsgname
        name = each.value.srname
        priority = each.value.priority
        direction =each.value.direction
        access = each.value.access
        protocol = each.value.protocol
        source_port_range = each.value.source_port_range
        destination_port_range = each.value.destination_port_range
        source_address_prefix = each.value.source_address_prefix
        destination_address_prefix = each.value.destination_address_prefix
    }
