resource "yandex_compute_disk" "two" {
  name  =  "disk-two"
  zone     = var.zone_yc
  image_id = "fd8781facvdr5090ovu6" # Ubuntu 22.04 LTS
  size     = 15
  type     = "network-hdd"
}

resource "yandex_compute_instance" "machine2" {
  name = "priv"
  allow_stopping_for_update = true
  platform_id               = "standard-v3"
  zone                      = var.zone_yc

  resources {
    cores  = "2"
    memory = "4"
  }

  boot_disk {
    disk_id = yandex_compute_disk.two.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.pub_key)}"
    
  }
  provisioner "local-exec" {
    command = "sudo apt-get -y update && sudo apt-get install -y nginx"
    interpreter = [ "/bin/bash", "-c" ]
}
}
