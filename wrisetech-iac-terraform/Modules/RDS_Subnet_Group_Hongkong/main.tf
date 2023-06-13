terraform {
  required_providers {
    hongkong = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

data "aws_vpc" "vpc_rds" {
  filter {
    name = "tag:Name"
    values = var.db_instance_hongkong[*]["vpc_name"]
  }
}

locals {
  lcl_vpc_rds = data.aws_vpc.vpc_rds.id
}

data "aws_subnet_ids" "example" {
  count = length(var.db_instance_hongkong[*]["subnet_name"])
  vpc_id = local.lcl_vpc_rds
  filter {
    name   = "tag:Name"
    values = flatten([var.db_instance_hongkong[*]["subnet_name"]])
  }

}

locals {
  dt_subnet_ids = data.aws_subnet_ids.example.*.ids
}

output "out_subnet_ids" {
  value = data.aws_subnet_ids.example.*.ids
}

resource "aws_db_subnet_group" "default" {
  count = length(var.db_instance_hongkong[*])
  name       = element(var.db_instance_hongkong[*]["db_subnet_grp_name"],count.index)
  subnet_ids = element(local.dt_subnet_ids,count.index)

  tags = {
    Name = element(var.db_instance_hongkong[*]["db_subnet_grp_name"],count.index)
    Environment = var.environment
  }
}