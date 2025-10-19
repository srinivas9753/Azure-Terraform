variable "policy_name" { type = string }
variable "resource_group_name" { type = string }
variable "recovery_vault_name" { type = string }
variable "recovery_vault_id" { type = string }
variable "storage_account_id" { type = string }
variable "share_name" { type = string }
variable "retention_days" { type = number, default = 7 }
