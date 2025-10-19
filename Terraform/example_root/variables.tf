
############################################################
# variables.tf
# Variables used by main.tf
############################################################

# -------------------------
# Global / Environment
# -------------------------

variable "environment" {
  description = "Deployment environment name (e.g., dev, qa, prod)"
  type        = string
  default     = "prod"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "eastus"
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
  default     = "rg-fullinfra"
}

# -------------------------
# Backend (remote state)
# -------------------------

variable "backend_resource_group" {
  description = "Resource group containing Terraform state storage account"
  type        = string
  default     = "tfstate-rg"
}

variable "backend_storage_account" {
  description = "Storage account name for Terraform remote backend"
  type        = string
  default     = "tfstatestorageacct"
}

variable "backend_container" {
  description = "Container name for Terraform state file"
  type        = string
  default     = "tfstate"
}

# -------------------------
# Authentication / Identity
# -------------------------

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD Tenant ID"
  type        = string
}

# -------------------------
# Virtual Machines
# -------------------------

variable "admin_username" {
  description = "Admin username for virtual machines"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Admin password for virtual machines"
  type        = string
  sensitive   = true
}

variable "linux_vm_size" {
  description = "Linux VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "windows_vm_size" {
  description = "Windows VM size"
  type        = string
  default     = "Standard_B2ms"
}

# -------------------------
# ExpressRoute
# -------------------------

variable "expressroute_provider_name" {
  description = "Name of the ExpressRoute service provider"
  type        = string
  default     = "YourCircuitProvider"
}

variable "expressroute_peering_location" {
  description = "ExpressRoute peering location"
  type        = string
  default     = "AnyLocation"
}

variable "expressroute_bandwidth_mbps" {
  description = "ExpressRoute circuit bandwidth in Mbps"
  type        = number
  default     = 50
}

variable "expressroute_vlan_id" {
  description = "VLAN ID for ExpressRoute private peering"
  type        = number
  default     = 200
}

# -------------------------
# Action Group
# -------------------------

variable "action_group_email" {
  description = "Email address for Action Group alerts"
  type        = string
  default     = "ops-team@example.com"
}
