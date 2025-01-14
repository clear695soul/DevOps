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
resource "yandex_compute_instance" "machine" {
  name        = "machine"
  platform_id = "standard-v2"
  zone        = var.zone_yc

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8781facvdr5090ovu6" # Ubuntu 22.04 LTS
    }
  }

  network_interface {
    subnet_id = lookup(var.subnets_ids, var.zone_yc)
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.pub_key)}"
    
  }
  provisioner "local-exec" {
    command = "sudo apt-get -y update && sudo apt-get install -y nginx"
    interpreter = [ "/bin/bash", "-c" ]
  }
}