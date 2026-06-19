data "azurerm_storage_account" "dstore" {
     for_each = var.conts
    name = each.value.stname
    resource_group_name = each.value.rgname
}