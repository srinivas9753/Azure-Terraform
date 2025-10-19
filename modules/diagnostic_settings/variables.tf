variable "name" { type = string }
variable "target_resource_id" { type = string }
variable "storage_account_id" { type = string }
variable "log_categories" { type = list(string), default = [] }
variable "metric_categories" { type = list(string), default = ["AllMetrics"] }
