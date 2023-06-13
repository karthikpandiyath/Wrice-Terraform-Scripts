# variable "cidr" {
#     type = string
# }

variable "environment" {
  type = string
  default = ""
}

variable "vpcs_singapore" {
  type = list
}

variable "public_subnets_singapore" {
  type = list
}

variable "private_subnets_singapore" {
  type = list
}