resource "yandex_vpc_network" "one_net" {
  name = "one-net"
}
resource "yandex_vpc_subnet" "private" {
  name           = "subnet-private"
  zone           = var.zone_yc
  v4_cidr_blocks = ["192.168.10.0/24"]
  network_id     = yandex_vpc_network.one_net.id
  }

resource "yandex_vpc_subnet" "public" {
  name           = "subnet-public"
  zone           = var.zone_yc
  v4_cidr_blocks = ["192.168.20.0/24"]
  network_id     = yandex_vpc_network.one_net.id
}
resource "yandex_vpc_address" "addr" {

  external_ipv4_address {
    zone_id = var.zone_yc
  }
}
resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = var.folder_id_yc
  name = "gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "global_route" {
  name       = "global-route"
  network_id = yandex_vpc_network.one_net.id
  folder_id  = var.folder_id_yc

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}
