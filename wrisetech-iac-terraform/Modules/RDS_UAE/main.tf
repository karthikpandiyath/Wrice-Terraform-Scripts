terraform {
  required_providers {
    uae = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

resource "aws_db_instance" "rds_singapore" {
    count = length(var.db_instance_uae[*])
    allocated_storage    = element(var.db_instance_uae[*]["allocated_storage"],count.index)
    engine               = element(var.db_instance_uae[*]["engine"],count.index)
    engine_version       = element(var.db_instance_uae[*]["engine_version"],count.index)
    instance_class       = element(var.db_instance_uae[*]["instance_class"],count.index)
    #db_name              = element(var.db_instance_uae[*]["db_name"],count.index)
    db_subnet_group_name = element(var.db_instance_uae[*]["db_subnet_grp_name"],count.index)
    username             = element(var.db_instance_uae[*]["username"],count.index)
    password             = element(var.db_instance_uae[*]["password"],count.index)
    skip_final_snapshot  = true
    identifier = element(var.db_instance_uae[*]["db_name"],count.index)
    multi_az = true
    tags = {
        name = element(var.db_instance_uae[*]["db_name"],count.index)
        Environment = var.environment
    }
}