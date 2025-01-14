output "subnets_ids" {
  value = { for i in data.yandex_vpc_subnet.all_subnets : i.zone => i.id }
}

output "subnets_info" {
  value = { for i in data.yandex_vpc_subnet.all_subnets : i.zone => i.v4_cidr_blocks[0] }
}