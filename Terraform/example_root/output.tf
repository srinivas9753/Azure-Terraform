
# --------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------
output "resource_group_name" {
  value = module.resource_group.name
}

output "storage_account_name" {
  value = module.storage_account.name
}

output "linux_vm_id" {
  value = module.linux_vm.id
}

output "windows_vm_id" {
  value = module.windows_vm.id
}

output "app_service_default_hostname" {
  value = module.app_service.default_hostname
}

output "application_gateway_id" {
  value = module.application_gateway.id
}

output "recovery_vault_id" {
  value = module.recovery_vault.id
}

output "data_protection_vault_id" {
  value = module.data_protection_vault.id
}

output "expressroute_circuit_id" {
  value = module.express_route.id
}
