# variable "cidr" {
#     type = string
# }

variable "environment" {
  type = string
  default = ""
}

variable "vpcs_uae" {
  type = list
}

variable "private_subnets_uae" {
  type = list
}