resource "azurerm_app_service" "this" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  site_config {
    always_on = var.always_on
  }

  app_settings = var.app_settings
  tags = var.tags
}
