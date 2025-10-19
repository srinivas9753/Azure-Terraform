variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "service_provider_name" { type = string }
variable "peering_location" { type = string }
variable "bandwidth_in_mbps" { type = number, default = 50 }
variable "sku_tier" { type = string, default = "Standard" }
variable "sku_family" { type = string, default = "MeteredData" }
variable "peer_asn" { type = number, default = 65010 }
variable "primary_peer_address_prefix" { type = string, default = "" }
variable "secondary_peer_address_prefix" { type = string, default = "" }
variable "vlan_id" { type = number, default = 200 }
variable "tags" { type = map(string), default = {} }
