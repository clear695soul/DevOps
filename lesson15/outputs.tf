output "info_subnets" {
  value = module.vpc_sub.subnets_info
}

output "info_zone" {
  value = var.zone_yc
}

output "vm_ip" {
  value = module.vm.vm_ip
}