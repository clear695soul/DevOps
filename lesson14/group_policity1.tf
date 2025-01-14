resource "yandex_vpc_security_group" "group1" {
  description = "ssh and http ports"
  network_id  = yandex_vpc_network.one_net.id

  ingress {
    protocol       = "TCP"
    description    = "rule http in"
    v4_cidr_blocks = ["192.168.20.0/24"]
    port           = 80
  }
    ingress {
    protocol       = "TCP"
    description    = "rule ssh in"
    v4_cidr_blocks = ["192.168.20.0/24"]
    port           = 22
  }

  egress {
    protocol       = "ANY"
    description    = "rule out"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port           = 1
    to_port = 65000
  }
}