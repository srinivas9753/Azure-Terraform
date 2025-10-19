resource "azurerm_managed_disk" "this" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_type
  create_option        = "Empty"
  disk_size_gb         = var.size_gb
  tags                 = var.tags
}
