resource "azurerm_backup_policy_file_share" "this" {
  name                = var.policy_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name

  schedule {
    frequency = "Daily"
    time      = "02:00"
  }

  retention_daily {
    count = var.retention_days
  }
}

resource "azurerm_backup_protected_file_share" "this" {
  name                = var.share_name
  resource_group_name = var.resource_group_name
  recovery_vault_id   = var.recovery_vault_id
  storage_account_id  = var.storage_account_id
  file_share_name     = var.share_name
  backup_policy_id    = azurerm_backup_policy_file_share.this.id
}
