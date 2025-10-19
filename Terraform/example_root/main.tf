############################################################
# main.tf
# Root configuration using Terraform modules for Azure Infra
############################################################
  backend "azurerm" {
    resource_group_name  = var.backend_resource_group
    storage_account_name = var.backend_storage_account
    container_name       = var.backend_container
    key                  = "envs/${var.environment}/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "random" {}

# Random suffix for unique naming
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

# --------------------------------------------------------------------
# Modules - Each handles one part of the infrastructure
# --------------------------------------------------------------------

# Resource Group
module "resource_group" {
  source   = "./modules/resource_group"
  location = var.location
  name     = var.resource_group
  environment = var.environment
}

# Network (VNet + Subnet)
module "network" {
  source              = "./modules/network"
  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
}

# Storage Account + File Share
module "storage_account" {
  source              = "./modules/storage_account"
  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
  random_suffix       = random_string.suffix.result
}

# Key Vault
module "key_vault" {
  source              = "./modules/key_vault"
  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
  tenant_id           = var.tenant_id
  admin_password      = var.admin_password
}

# Recovery Services Vault (VM + FileShare Backup)
module "recovery_vault" {
  source              = "./modules/recovery_vault"
  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
  sa_id               = module.storage_account.id
  fileshare_name      = module.storage_account.fileshare_name
}

# Data Protection Vault (Blob + Disk backup)
module "data_protection_vault" {
  source              = "./modules/data_protection_vault"
  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
  sa_id               = module.storage_account.id
}

# Managed Data Disk
module "managed_disk" {
  source              = "./modules/managed_disk"
  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
}

# Linux VM
module "linux_vm" {
  source              = "./modules/linux_vm"
  resource_group_name = module.resource_group.name
  subnet_id           = module.network.subnet_id
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  data_disk_id        = module.managed_disk.id
  environment         = var.environment
}

# Windows VM
module "windows_vm" {
  source              = "./modules/windows_vm"
  resource_group_name = module.resource_group.name
  subnet_id           = module.network.subnet_id
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  environment         = var.environment
}

# App Service Plan + App Service
module "app_service_plan" {
  source              = "./modules/app_service_plan"
  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
}

module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = module.resource_group.name
  location            = var.location
  plan_id             = module.app_service_plan.id
  environment         = var.environment
}

# Application Gateway
module "application_gateway" {
  source              = "./modules/application_gateway"
  resource_group_name = module.resource_group.name
  location            = var.location
  subnet_id           = module.network.subnet_id
  environment         = var.environment
}

# Action Group (monitoring)
module "action_group" {
  source              = "./modules/action_group"
  resource_group_name = module.resource_group.name
  environment         = var.environment
}

# Diagnostic Settings
module "diagnostic_settings" {
  source              = "./modules/diagnostic_settings"
  target_resource_id  = module.storage_account.id
  storage_account_id  = module.storage_account.id
  environment         = var.environment
}

# ExpressRoute
module "express_route" {
  source              = "./modules/express_route"
  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
}
