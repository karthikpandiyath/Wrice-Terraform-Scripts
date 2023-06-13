terraform {
  required_providers {
    uae = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

data "aws_vpc" "vpc_igw_uae" {
  count = length(var.vpcs_uae[*])
  filter {
    name = "tag:Name"
    values = [element(var.vpcs_uae[*]["name"],count.index)]
  }
}

locals {
  lcl_vpc_igw = data.aws_vpc.vpc_igw_uae.*.id
}

resource "aws_internet_gateway" "igw_uae" {
  count = length(local.lcl_vpc_igw)
  vpc_id = element(local.lcl_vpc_igw,count.index)

  tags = {
    Name = format("%s",element(var.vpcs_uae[*]["name"],count.index))
    Environment = var.environment
  }
}

output "igw_id_uae" {
  value = aws_internet_gateway.igw_uae.*.id
}