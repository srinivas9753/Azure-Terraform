variable "vm_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "subnet_id" { type = string }
variable "vm_size" { type = string, default = "Standard_B2ms" }
variable "admin_username" { type = string }
variable "admin_password" { type = string, sensitive = true }
variable "attach_data_disk" { type = bool, default = false }
variable "data_disk_id" { type = string, default = "" }
variable "tags" { type = map(string), default = {} }
