terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.70"
    }
  }
  required_version = ">= 1.00"
}

# provider "yandex" {
#   zone = var.zone_yc
#   folder_id = var.folder_id_yc
#   cloud_id  = var.cloud_id_yc
#   service_account_key_file = "./alex.json"
# }

data "yandex_vpc_network" "default" {
  network_id = var.yc_vpc_id
}

data "yandex_vpc_subnet" "all_subnets" {
  subnet_id = each.key
  for_each  = toset(data.yandex_vpc_network.default.subnet_ids)
}