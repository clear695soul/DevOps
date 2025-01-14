terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.70"
    }
  }
  required_version = ">= 1.00"
}

provider "yandex" {
  zone                     = var.zone_yc
  folder_id                = var.folder_id_yc
  cloud_id                 = var.cloud_id_yc
  service_account_key_file = "./alex.json"

}
module "vpc_sub" {
  source       = "./vpc_sub"
  cloud_id_yc  = var.cloud_id_yc
  folder_id_yc = var.folder_id_yc
  key_file     = var.key_file
  yc_vpc_id    = var.yc_vpc_id
}
module "vm" {
  source       = "./vm"
  subnets_ids   = module.vpc_sub.subnets_ids
  cloud_id_yc  = var.cloud_id_yc
  folder_id_yc = var.folder_id_yc
  key_file     = var.key_file
  zone_yc      = var.zone_yc
  priv_key     = var.priv_key
  pub_key      = var.pub_key
}