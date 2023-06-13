terraform {
  required_providers {
    uae = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

#Mumbai VPC Creation
resource "aws_vpc" "vpc_uae" {

  count = length(var.vpcs_uae[*])
  cidr_block       = element(var.vpcs_uae[*]["cidr_block"],count.index)
  instance_tenancy = "default"
  enable_dns_hostnames = true
  #provider = aws.mumbai
  tags = {
    Name = format("%s",element(var.vpcs_uae[*]["name"],count.index))
    Environment = var.environment
  }
}

output "vpc_id_uae"{
  value = length(aws_vpc.vpc_uae.*.id)
}


