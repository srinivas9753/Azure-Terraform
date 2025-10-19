output "vm_id" { value = azurerm_windows_virtual_machine.this.id }
output "private_ip" { value = azurerm_network_interface.this.ip_configuration[0].private_ip_address }
