resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  min_tls_version          = "TLS1_2"
  allow_blob_public_access = false
  tags                     = var.tags
}
