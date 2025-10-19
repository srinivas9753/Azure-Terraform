variable "disk_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "storage_type" { type = string, default = "Standard_LRS" }
variable "size_gb" { type = number, default = 100 }
variable "tags" { type = map(string), default = {} }
