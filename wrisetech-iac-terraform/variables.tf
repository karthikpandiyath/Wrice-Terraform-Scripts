# ##### General #####

variable "region_HK" {
  type = string
}

variable "region_SG" {
  type = string
}

variable "region_UAE" {
  type = string
}

variable "environment" {
  type = string
}

# ##### VPC #######
variable "vpcs_singapore" {
  type = list
}

variable "vpcs_hongkong" {
  type = list
}

variable "vpcs_uae" {
  type = list
}
# ##### EC2 #########
# variable "ec2_instance" {
#   type = list
# }

# # variable "instance_id" {
# #   type = list(string)
# # }

# ##### Subnets #######
variable "private_subnets_singapore" {
  type = list
}

variable "public_subnets_singapore" {
  type = list
}

variable "private_subnets_uae" {
  type = list
}

variable "private_subnets_hongkong" {
  type = list
}

##### RDS #####
variable "db_instance_singapore" {
  type = list
}

variable "db_instance_hongkong" {
  type = list
}

variable "db_instance_uae" {
  type = list
}

# variable "default_route_table_id" {
#   type = string
#   default = ""
# }

# variable "InternetGateway_Pepul_id" {
#   type = string
#   default = ""
# }

# variable "route_table_id" {
#   type=list(string)
#   default=[]
# }

# variable "route_cidr" {
#   type = string
#   description = "Route Table CIDR "
# }

# ####################################
# ##### NACL Variables################
variable "nacl_singapore" {
  type = list
}

variable "nacl_uae" {
  type = list
}

variable "nacl_hongkong" {
  type = list
}

# variable "egress_protocol" {
#   type = string
#   description = "Enter NACL - egress_protocol"
# }

# variable "egress_rule_no" {
#   type = number
#   description = "Enter NACL - egress_rule_no"
# }

# variable "egress_action" {
#   type = string
#   description = "Enter NACL - egress_action"
# }

# variable "egress_cidr" {
#   type = string
#   description = "Enter NACL - egress_cidr"
# }

# variable "egress_from_port" {
#   type = number
#   description = "Enter NACL - egress_from_port"
# }

# variable "egress_to_port" {
#   type = number
#   description = "Enter NACL - egress_to_port"
# }

# variable "ingress_protocol" {
#   type = string
#   description = "Enter NACL - ingress_protocol"
# }

# variable "ingress_rule_no" {
#   type = number
#   description = "Enter NACL - ingress_rule_no"
# }

# variable "ingress_action" {
#   type = string
#   description = "Enter NACL - ingress_action"
# }

# variable "ingress_cidr" {
#   type = string
#   description = "Enter NACL - ingress_cidr"
# }

# variable "ingress_from_port" {
#   type = number
#   description = "Enter NACL - ingress_from_port"
# }

# variable "ingress_to_port" {
#   type = number
#   description = "Enter NACL - ingress_to_port"
# }

# ####################################################

# variable "destination_cidr_block"{
#   type = string
#   description = "The destination CIDR block."
# }

# variable rt_name {
#   description = "Route Name of Route"
#   type = string
# }

# variable pvt_rt_name {
#   type = string
# }


# # variable "instance_type" {
# #   type = list(string)
# # }

# # variable "ec2_name" {
# #   type = list(string)
# # }

# ############### NAT Gateway Vars ################3
# 
# # variable "private_subnet_id"{
# #   type = list(string)
# # }



# variable "nat_gateway_name"{
#   type = string
# }

# #variable "ebs_size" {
# #  type = number
# #}

# #variable "ebs_name"{
# #  type = list(string)
# #}

# # variable "volume_id" {
# #   type = string
# # }

# #variable "device_name" {
# #  type = list(string)
# #}
