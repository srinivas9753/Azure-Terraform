variable "app_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "app_service_plan_id" { type = string }
variable "always_on" { type = bool, default = true }
variable "app_settings" { type = map(string), default = {} }
variable "tags" { type = map(string), default = {} }
