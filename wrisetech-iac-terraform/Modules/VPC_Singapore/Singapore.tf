terraform {
  required_providers {
    singapore = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

#Singapore VPC Creation
resource "aws_vpc" "vpc_singapore" {

  count = length(var.vpcs_singapore[*])
  cidr_block       = element(var.vpcs_singapore[*]["cidr_block"],count.index)
  instance_tenancy = "default"
  enable_dns_hostnames = true
  #provider = aws.mumbai
  tags = {
    Name = format("%s",element(var.vpcs_singapore[*]["name"],count.index))
    Environment = var.environment
  }
}

output "vpc_id_singapore"{
  value = aws_vpc.vpc_singapore.*.id
}