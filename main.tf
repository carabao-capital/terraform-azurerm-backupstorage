resource "azurerm_storage_account" "backup" {
  name                = replace("${var.resource_group_name}-backup", "/[^a-z0-9]/", "")
  resource_group_name = var.resource_group_name
  location            = var.location

  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = var.tags
}

resource "azurerm_storage_container" "backup" {
  for_each = var.buckets

  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.backup.name
  container_access_type = each.value.container_access_type

  lifecycle {
    prevent_destroy = true
  }
}
