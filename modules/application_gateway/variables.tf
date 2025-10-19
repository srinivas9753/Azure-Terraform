variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "subnet_id" { type = string }
variable "public_ip_id" { type = string }
variable "sku_name" { type = string, default = "Standard_v2" }
variable "sku_tier" { type = string, default = "Standard_v2" }
variable "capacity" { type = number, default = 2 }
variable "tags" { type = map(string), default = {} }
