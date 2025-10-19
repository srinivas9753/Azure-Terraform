#provider creation
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.120.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.0"
    }
  }

# (Optional) Set default subscription or tenant IDs if not using environment variables
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

