terraform {
  required_providers {
    hongkong = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

data "aws_vpc" "vpc_igw_hongkong" {
  count = length(var.vpcs_hongkong[*])
  filter {
    name = "tag:Name"
    values = [element(var.vpcs_hongkong[*]["name"],count.index)]
  }
}

locals {
  lcl_vpc_igw = data.aws_vpc.vpc_igw_hongkong.*.id
}

resource "aws_internet_gateway" "igw_hongkong" {
  count = length(local.lcl_vpc_igw)
  vpc_id = element(local.lcl_vpc_igw,count.index)
  tags = {
    Name = format("%s%s%s",var.environment,"-",element(var.vpcs_hongkong[*]["name"],count.index))
    Environment = var.environment
  }
}

output "igw_id_hongkong" {
  value = aws_internet_gateway.igw_hongkong.*.id
}