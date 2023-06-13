terraform {
  required_providers {
    singapore = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

data "aws_vpc" "vpc_igw" {
  count = length(var.vpcs_singapore[*])
  filter {
    name = "tag:Name"
    values = [element(var.vpcs_singapore[*]["name"],count.index)]
  }
}

locals {
  lcl_vpc_igw = data.aws_vpc.vpc_igw.*.id
}

resource "aws_internet_gateway" "igw_singapore" {
  count = length(local.lcl_vpc_igw)
  vpc_id = element(local.lcl_vpc_igw,count.index)

  tags = {
    Name = format("%s",element(var.vpcs_singapore[*]["name"],count.index))
    Environment = var.environment
  }
}

output "igw_id_singapore" {
  value = aws_internet_gateway.igw_singapore.*.id
}