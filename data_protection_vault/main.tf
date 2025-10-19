resource "azurerm_data_protection_backup_vault" "this" {
  name                = var.vault_name
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_settings {
    vault_storage_type = "LocallyRedundant"
  }

  tags = var.tags
}
