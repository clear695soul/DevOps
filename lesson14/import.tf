resource "yandex_compute_instance" "machine3" {
  name = "machine3"
  allow_stopping_for_update = null
  platform_id               = "standard-v3"
  zone                      = var.zone_yc

  resources {
    cores  = "2"
    memory = "2"
  }

  boot_disk {
    disk_id = "epdfg6scbcgeqi74avo5"
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat = true
    nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address

  }
  metadata = {
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD0JVZx+rhq0wgDmiHR/riD2ERGqTFbWaIydwop9VDR9yZToG67v6kUSlL7nbioQkqVaoDPubj+XrhRmgRjN/Tw68ujD3eTSm96OVz8CAsDgJNUYLYm9CnmWQnUQHTCHswadf1GUBKbUosd1/jbVGQ7B1vgJSV4761gtzOfPnHtnVfNrCAGAmGtAaUekOuK0ineZJCE5rT8KrdaabK+gxKzSOWnR/qEGZJMQ/xLheee8pLoY7BGkD7Z2uGxL1EzZjDCD2sGi/LNxbxn4thW63SEC2dRDcjpzEp08HDROhv1Hfi4tSSm9xSvsvteY27tsMSiuvCaOxV4gXNCrYmJtsOyJIyc67+grA6Szo2j7aDORlVLGy+6hcP8E46OV6z0F/Df1D1RUaeJAIjoKkOOXF5GP5iKrxI5w/Jro79fidWV01AuRyBmXmZPf2PuNeMKjRfXkAHpGcF2Cq4JoJ8hzPrgc0ZkD3P5z70CPCH+HGnZvihHgZu1vG7p4J7i5RZBKhk= root@DESKTOP-7N9E6VQ\n",
    user-data = "#cloud-config\ndatasource:\n Ec2:\n  strict_id: false\nssh_pwauth: no\nusers:\n- name: ubuntu\n  sudo: ALL=(ALL) NOPASSWD:ALL\n  shell: /bin/bash\n  ssh_authorized_keys:\n  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD0JVZx+rhq0wgDmiHR/riD2ERGqTFbWaIydwop9VDR9yZToG67v6kUSlL7nbioQkqVaoDPubj+XrhRmgRjN/Tw68ujD3eTSm96OVz8CAsDgJNUYLYm9CnmWQnUQHTCHswadf1GUBKbUosd1/jbVGQ7B1vgJSV4761gtzOfPnHtnVfNrCAGAmGtAaUekOuK0ineZJCE5rT8KrdaabK+gxKzSOWnR/qEGZJMQ/xLheee8pLoY7BGkD7Z2uGxL1EzZjDCD2sGi/LNxbxn4thW63SEC2dRDcjpzEp08HDROhv1Hfi4tSSm9xSvsvteY27tsMSiuvCaOxV4gXNCrYmJtsOyJIyc67+grA6Szo2j7aDORlVLGy+6hcP8E46OV6z0F/Df1D1RUaeJAIjoKkOOXF5GP5iKrxI5w/Jro79fidWV01AuRyBmXmZPf2PuNeMKjRfXkAHpGcF2Cq4JoJ8hzPrgc0ZkD3P5z70CPCH+HGnZvihHgZu1vG7p4J7i5RZBKhk= root@DESKTOP-7N9E6VQ"
    serial-port-enable = 0
    
  }
}