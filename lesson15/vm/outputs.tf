output "vm_ip" {
  value = yandex_compute_instance.machine.network_interface[0].ip_address
}