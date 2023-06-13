terraform {
  required_providers {
    singapore = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

resource "aws_db_instance" "rds_singapore" {
    count = length(var.db_instance_singapore[*])
    allocated_storage    = element(var.db_instance_singapore[*]["allocated_storage"],count.index)
    engine               = element(var.db_instance_singapore[*]["engine"],count.index)
    engine_version       = element(var.db_instance_singapore[*]["engine_version"],count.index)
    instance_class       = element(var.db_instance_singapore[*]["instance_class"],count.index)
    #db_name              = element(var.db_instance_singapore[*]["db_name"],count.index)
    db_subnet_group_name = element(var.db_instance_singapore[*]["db_subnet_grp_name"],count.index)
    username             = element(var.db_instance_singapore[*]["username"],count.index)
    password             = element(var.db_instance_singapore[*]["password"],count.index)
    skip_final_snapshot  = true
    identifier = element(var.db_instance_singapore[*]["db_name"],count.index)
    multi_az = true
    tags = {
        name = element(var.db_instance_singapore[*]["db_name"],count.index)
        Environment = var.environment
    }
}