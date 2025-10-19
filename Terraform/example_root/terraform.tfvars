#############################################
# Global Configuration
#############################################

# Environment name (used in naming conventions and backend key)
environment = "prod"

# Azure region where all resources will be deployed
location = "eastus"

#############################################
# Backend Configuration
#############################################

#############################################
# Subscription & Tenant Details
#############################################

# Azure authentication details
subscription_id = "00000000-0000-0000-0000-000000000000"
tenant_id       = "00000000-0000-0000-0000-000000000000"

#############################################
# Resource Group
#############################################

# Main resource group for all infrastructure
resource_group = "rg-terraform-prod"

#############################################
# Virtual Network and Subnet Configuration
#############################################

vnet_name           = "vnet-prod"
vnet_address_space  = ["10.0.0.0/16"]
subnet_name         = "subnet-prod"
subnet_address_prefix = "10.0.1.0/24"

#############################################
# Administrator Credentials
#############################################

admin_username = "azureadmin"
admin_password = "SecurePassword123!"

#############################################
# Virtual Machines
#############################################

# Linux VM Configuration
linux_vm_name        = "vm-linux-prod"
linux_vm_size        = "Standard_B2ms"
linux_vm_image_publisher = "Canonical"
linux_vm_image_offer     = "0001-com-ubuntu-server-focal"
linux_vm_image_sku       = "20_04-lts-gen2"
linux_vm_image_version   = "latest"

# Windows VM Configuration
windows_vm_name        = "vm-windows-prod"
windows_vm_size        = "Standard_B2ms"
windows_vm_image_publisher = "MicrosoftWindowsServer"
windows_vm_image_offer     = "WindowsServer"
windows_vm_image_sku       = "2019-Datacenter"
windows_vm_image_version   = "latest"

#############################################
# Storage Account and File Share
#############################################

storage_account_name = "stterraformprod"
storage_account_tier = "Standard"
storage_account_replication = "LRS"
file_share_name      = "prodshare"
file_share_quota_gb  = 100

#############################################
# Key Vault
#############################################

key_vault_name = "kv-terraform-prod"
key_vault_sku  = "standard"

#############################################
# Recovery Vault (VM + Fileshare Backup)
#############################################

recovery_vault_name = "rsv-prod"
recovery_vault_sku  = "Standard"

#############################################
# Data Protection Vault (Blob + Disk Backup)
#############################################

data_protection_vault_name = "dpv-prod"

#############################################
# Managed Disk
#############################################

managed_disk_name  = "datadisk-prod"
managed_disk_size  = 128
managed_disk_sku   = "Premium_LRS"

#############################################
# App Service & Plan
#############################################

app_service_plan_name = "asp-prod"
app_service_plan_tier = "P1v3"
app_service_plan_size = "P1v3"

app_service_name = "appservice-prod"

#############################################
# Application Gateway
#############################################

app_gateway_name = "appgw-prod"
app_gateway_tier = "WAF_v2"
app_gateway_capacity = 2

#############################################
# Action Group (Monitoring)
#############################################

action_group_name   = "ag-prod"
action_group_email  = "alerts@mycompany.com"

#############################################
# Diagnostic Settings
#############################################

diagnostic_logs_retention_days = 30

#############################################
# ExpressRoute
#############################################

express_route_name           = "er-prod"
express_route_service_provider = "Equinix"
express_route_peering_location = "Silicon Valley"
express_route_bandwidth_mbps   = 200

