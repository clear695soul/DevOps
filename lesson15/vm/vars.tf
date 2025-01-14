variable "cloud_id_yc" {
  type = string
}

variable "folder_id_yc" {
  type = string
}

variable "key_file" {
  type = string
}

variable "zone_yc" {
  type = string
}

variable "subnets_ids" {
  type = map(string)
}

variable "pub_key" {
  type = string
}

variable "priv_key" {
  type = string
}