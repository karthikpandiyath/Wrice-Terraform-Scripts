terraform {
  required_providers {
    hongkong = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

#Singapore VPC Creation
resource "aws_vpc" "vpc_hongkong" {

  count = length(var.vpcs_hongkong[*])
  cidr_block       = element(var.vpcs_hongkong[*]["cidr_block"],count.index)
  instance_tenancy = "default"
  enable_dns_hostnames = true
  #provider = aws.mumbai
  tags = {
    Name = format("%s",element(var.vpcs_hongkong[*]["name"],count.index))
    Environment = var.environment
  }
}

output "vpc_id_hongkong"{
  value = aws_vpc.vpc_hongkong.*.id
}