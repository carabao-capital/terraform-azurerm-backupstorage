output "account_name" {
  value = azurerm_storage_account.backup.name
}

output "client_id" {
  value = azurerm_storage_account.backup.identity.0.principal_id
}

output "client_secret" {
  value     = azurerm_storage_account.backup.primary_access_key
  sensitive = true
}
