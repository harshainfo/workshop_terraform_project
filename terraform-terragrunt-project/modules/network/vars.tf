variable "region" {
}

variable "cidr" {
  default = "172.16.0.0/20"
}

variable "public_cidrs" {
  default = "172.16.0.0/23,172.16.2.0/23"
}

variable "private_cidrs" {
  default = "172.16.8.0/23,172.16.10.0/23"
}

variable "tags" {
  type = map(string)
}

