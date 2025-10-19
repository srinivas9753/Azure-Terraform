resource "azurerm_storage_share" "this" {
  name                 = var.share_name
  storage_account_name = var.storage_account_name
  quota                = var.quota_gb
}
