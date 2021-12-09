resource "random_id" "backup" {
  keepers = {
    rg_name     = var.resource_group_name
    rg_location = var.location
  }
  byte_length = 11
}

resource "azurerm_storage_account" "backup" {
  name                = "sa${random_id.backup.hex}"
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

  name                  = each.key
  storage_account_name  = azurerm_storage_account.backup.name
  container_access_type = each.value.container_access_type

  lifecycle {
    prevent_destroy = true
  }
}
