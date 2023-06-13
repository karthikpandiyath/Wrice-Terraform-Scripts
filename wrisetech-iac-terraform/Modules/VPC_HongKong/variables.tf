# variable "cidr" {
#     type = string
# }

variable "environment" {
  type = string
  default = ""
}

variable "vpcs_hongkong" {
  type = list
}

variable "private_subnets_hongkong" {
  type = list
}