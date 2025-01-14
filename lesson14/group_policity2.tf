resource "yandex_vpc_security_group" "group2" {
  description = "ssh and 8080 ports"
  network_id  = yandex_vpc_network.one_net.id

  ingress {
    protocol       = "TCP"
    description    = "rule 8080 in"
    v4_cidr_blocks = ["192.168.10.0/24"]
    port           = 8080
  }
    ingress {
    protocol       = "TCP"
    description    = "rule ssh in"
    v4_cidr_blocks = ["192.168.10.0/24"]
    port           = 22
  }

  egress {
    protocol       = "ANY"
    description    = "rule out"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port         = -1
  }
}