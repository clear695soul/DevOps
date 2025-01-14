variable "zone_yc" { 
  type = string
}
variable "ip_host" { 
  type = string
}
variable "pw" { 
  type = string
}
variable "pub_key" { 
  type = string
}
variable "priv_key" { 
  type = string
}
resource "yandex_compute_disk" "one" {
  name  =  "disk-one"
  zone     = var.zone_yc
  image_id = "fd8781facvdr5090ovu6" # Ubuntu 22.04 LTS
  size     = 15
  type     = "network-hdd"
}

resource "yandex_compute_instance" "machine1" {
  name = "pub"
  allow_stopping_for_update = true
  platform_id               = "standard-v3"
  zone                      = var.zone_yc

  resources {
    cores  = "2"
    memory = "4"
  }

  boot_disk {
    disk_id = yandex_compute_disk.one.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat = true
    nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address

  }
  metadata = {
    user-data = "${file("./cloud-init.yaml")}"
    ssh-keys = "ubuntu:${file(var.pub_key)}"
    serial-port-enable = 1
    
  }
}
resource "null_resource" "config_machine1" {
  depends_on = [yandex_compute_instance.machine1]
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
    ]
      connection {
        type        = "ssh"
        port = 22
        user        = "ubuntu"
        agent = "false"
        host        = yandex_compute_instance.machine1.network_interface[0].nat_ip_address
        private_key = file(var.priv_key)
    }
  }
}