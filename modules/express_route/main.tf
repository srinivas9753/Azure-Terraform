resource "azurerm_express_route_circuit" "this" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  service_provider_name = var.service_provider_name
  peering_location      = var.peering_location
  bandwidth_in_mbps     = var.bandwidth_in_mbps

  sku {
    tier   = var.sku_tier
    family = var.sku_family
  }

  tags = var.tags
}

resource "azurerm_express_route_circuit_peering" "private" {
  express_route_circuit_name = azurerm_express_route_circuit.this.name
  resource_group_name        = var.resource_group_name
  peering_type               = "AzurePrivatePeering"
  peer_asn                   = var.peer_asn
  primary_peer_address_prefix   = var.primary_peer_address_prefix
  secondary_peer_address_prefix = var.secondary_peer_address_prefix
  vlan_id                    = var.vlan_id
}
