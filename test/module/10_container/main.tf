resource "azurerm_storage_container" "contblock" {
    for_each = var.conts
    name = each.value.name
    storage_account_id = data.azurerm_storage_account.dstore[each.key].id
    container_access_type = each.value.container_access_type
}