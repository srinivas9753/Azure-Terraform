#provider creation
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.45.1"
    }
  }
}
provider "azurerm" {
  features {}

# (Optional) Set default subscription or tenant IDs if not using environment variables
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
