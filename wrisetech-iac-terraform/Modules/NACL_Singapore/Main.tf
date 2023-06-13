terraform {
  required_providers {
    singapore = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

data "aws_vpc" "vpc_nacl" {
  count = length(var.nacl_singapore[*])
  filter {
    name = "tag:Name"
    values = [element(var.nacl_singapore[*]["vpc_name"],count.index)]
  }
}

locals {
  lcl_vpc_nacl = data.aws_vpc.vpc_nacl.*.id
}


data "aws_subnet_ids" "example" {
  count = length(var.nacl_singapore[*])
  vpc_id = element(local.lcl_vpc_nacl,count.index)
  filter {
    name   = "tag:Name"
    values = toset(element((var.nacl_singapore[*]["subnet_name"]), count.index))
  }
  depends_on = [
    local.lcl_vpc_nacl
  ]
}

locals {
  lcl_subnet_nacl = data.aws_subnet_ids.example.*.ids
}

output "out_subnet_nacl" {
  value = data.aws_subnet_ids.example.*.ids
}
resource "aws_network_acl" "nacl" {
  count = length(var.nacl_singapore[*])
  vpc_id = element(local.lcl_vpc_nacl,count.index)
  subnet_ids = element(local.lcl_subnet_nacl,count.index)

  egress {
    protocol   = element(var.nacl_singapore[*]["egress_protocol"],count.index)
    rule_no    = element(var.nacl_singapore[*]["egress_rule_no"],count.index)
    action     = element(var.nacl_singapore[*]["egress_action"],count.index)
    cidr_block = element(var.nacl_singapore[*]["egress_cidr"],count.index)
    from_port  = element(var.nacl_singapore[*]["egress_from_port"],count.index)
    to_port    = element(var.nacl_singapore[*]["egress_to_port"],count.index)
  }

  ingress {
    protocol   = element(var.nacl_singapore[*]["ingress_protocol"],count.index)
    rule_no    = element(var.nacl_singapore[*]["ingress_rule_no"],count.index)
    action     = element(var.nacl_singapore[*]["ingress_action"],count.index)
    cidr_block = element(var.nacl_singapore[*]["ingress_cidr"],count.index)
    from_port  = element(var.nacl_singapore[*]["ingress_from_port"],count.index)
    to_port    = element(var.nacl_singapore[*]["ingress_to_port"],count.index)
  }

  tags = {
    Name = element(var.nacl_singapore[*]["acl_name"],count.index)
    Environment = var.environment
  }
}

# resource "aws_network_acl_association" "network_acl_association" {
#   network_acl_id = aws_network_acl.public_NACL_Pepul.id
#   subnet_id      = var.subnet_id[*]
# }

# resource "aws_network_acl" "private_NACL_Pepul" {
#   vpc_id = var.vpc_id
#   subnet_ids = var.private_subnet_id

#   egress {
#     protocol   = var.egress_protocol
#     rule_no    = var.egress_rule_no
#     action     = var.egress_action
#     cidr_block = var.egress_cidr
#     from_port  = var.egress_from_port
#     to_port    = var.egress_to_port
#   }

#   ingress {
#     protocol   = var.ingress_protocol
#     rule_no    = var.ingress_rule_no
#     action     = var.ingress_action
#     cidr_block = var.ingress_cidr
#     from_port  = var.ingress_from_port
#     to_port    = var.ingress_to_port
#   }

#   tags = {
#     Name = format("%s%s",var.environment,"-private_NACL_Pepul")
#     Environment = var.environment
#   }
# }