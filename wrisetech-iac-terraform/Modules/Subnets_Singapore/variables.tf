
variable "environment" {
  type = string
  default = ""
}

variable "vpcs_singapore" {
  type = list
}

variable "private_subnets_singapore" {
  type = list
}

variable "public_subnets_singapore" {
  type = list
}

# variable "public_subnet_id" {
#   type = string
# }

# variable "private_subnet_id" {
#   type = string
# }


# variable "instance_id" {
#   type = string
# }