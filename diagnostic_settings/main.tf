resource "azurerm_monitor_diagnostic_setting" "this" {
  name               = var.name
  target_resource_id = var.target_resource_id
  storage_account_id = var.storage_account_id

  dynamic "log" {
    for_each = var.log_categories
    content {
      category = log.value
      enabled  = true
    }
  }

  dynamic "metric" {
    for_each = var.metric_categories
    content {
      category = metric.value
      enabled  = true
      retention_policy { enabled = false }
    }
  }
}
