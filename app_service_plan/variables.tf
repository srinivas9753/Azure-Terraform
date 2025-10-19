variable "plan_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "sku_tier" { type = string, default = "Standard" }
variable "sku_size" { type = string, default = "S1" }
variable "tags" { type = map(string), default = {} }
