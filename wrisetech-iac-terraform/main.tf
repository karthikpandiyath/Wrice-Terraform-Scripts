module "VPC_Singapore" {
    source = "./Modules/VPC_Singapore"
    environment = var.environment
    providers = {
        singapore = aws.singapore
    }
    vpcs_singapore = var.vpcs_singapore
    private_subnets_singapore = var.private_subnets_singapore
    public_subnets_singapore = var.public_subnets_singapore
    #instance_id = module.ec2.inst_id
}

module "VPC_HongKong" {
    source = "./Modules/VPC_HongKong"
    environment = var.environment
    providers = {
        hongkong = aws.hongkong
    }
    vpcs_hongkong = var.vpcs_hongkong
    private_subnets_hongkong = var.private_subnets_hongkong
    #instance_id = module.ec2.inst_id
}

module "VPC_UAE" {
    source = "./Modules/VPC_UAE"
    environment = var.environment
    providers = {
        uae = aws.uae
    }
    vpcs_uae = var.vpcs_uae
    private_subnets_uae = var.private_subnets_uae
    #instance_id = module.ec2.inst_id
}


module "Subnet_Singapore" {
    source = "./Modules/Subnets_Singapore"
    environment = var.environment
    providers = {
        singapore = aws.singapore
    }
    vpcs_singapore = var.vpcs_singapore
    private_subnets_singapore = var.private_subnets_singapore
    public_subnets_singapore = var.public_subnets_singapore
    depends_on = [
        module.VPC_Singapore
    ]
    #instance_id = module.ec2.inst_id
}

module "Subnet_HongKong" {
    source = "./Modules/Subnets_HongKong"
    environment = var.environment
    providers = {
        hongkong = aws.hongkong
    }
    vpcs_hongkong = var.vpcs_hongkong
    private_subnets_hongkong = var.private_subnets_hongkong
    depends_on = [
        module.VPC_HongKong
    ]
    #instance_id = module.ec2.inst_id
}

module "Subnet_UAE" {
    source = "./Modules/Subnets_UAE"
    environment = var.environment
    providers = {
        uae = aws.uae
    }
    vpcs_uae = var.vpcs_uae
    private_subnets_uae = var.private_subnets_uae
    depends_on = [
        module.VPC_UAE
    ]
    #instance_id = module.ec2.inst_id
}

module "NACL_singapore" {
    source = "./Modules/NACL_Singapore"
    environment = var.environment
    providers = {
        singapore = aws.singapore
    }
    nacl_singapore = var.nacl_singapore
    depends_on = [
        module.VPC_Singapore,
        module.Subnet_Singapore
    ]
}

module "NACL_UAE" {
    source = "./Modules/NACL_UAE"
    environment = var.environment
    providers = {
        uae = aws.uae
    }
    nacl_uae = var.nacl_uae
    depends_on = [
        module.VPC_UAE,
        module.Subnet_UAE
    ]
}

module "NACL_HongKong" {
    source = "./Modules/NACL_HongKong"
    environment = var.environment
    providers = {
        hongkong = aws.hongkong
    }
    nacl_hongkong = var.nacl_hongkong
    depends_on = [
        module.VPC_HongKong,
        module.Subnet_HongKong
    ]
}

module "RDS_Subnet_Group_Singapore"{
    source = "./Modules/RDS_Subnet_Group_Singapore"
    environment = var.environment
    providers = {
        singapore = aws.singapore
    }
    db_instance_singapore = var.db_instance_singapore
    depends_on = [
    module.VPC_Singapore,
    module.Subnet_Singapore
  ]
}

module "RDS_Singapore"{
    source = "./Modules/RDS_Singapore"
    environment = var.environment
    providers = {
        singapore = aws.singapore
    }
    db_instance_singapore = var.db_instance_singapore
    depends_on = [
    module.RDS_Subnet_Group_Singapore
  ]
}

module "RDS_Subnet_Group_Hongkong"{
    source = "./Modules/RDS_Subnet_Group_Hongkong"
    environment = var.environment
    providers = {
        hongkong = aws.hongkong
    }
    db_instance_hongkong = var.db_instance_hongkong
    depends_on = [
    module.VPC_HongKong,
    module.Subnet_HongKong
  ]
}

module "RDS_Hongkong"{
    source = "./Modules/RDS_Hongkong"
    environment = var.environment
    providers = {
        hongkong = aws.hongkong
    }
    db_instance_hongkong = var.db_instance_hongkong
    depends_on = [
    module.RDS_Subnet_Group_Hongkong
  ]
}

module "RDS_Subnet_Group_UAE"{
    source = "./Modules/RDS_Subnet_Group_UAE"
    environment = var.environment
    providers = {
        uae = aws.uae
    }
    db_instance_uae = var.db_instance_uae
    depends_on = [
    module.VPC_UAE,
    module.Subnet_UAE
  ]
}

module "RDS_UAE"{
    source = "./Modules/RDS_UAE"
    environment = var.environment
    providers = {
        uae = aws.uae
    }
    db_instance_uae = var.db_instance_uae
    depends_on = [
    module.RDS_Subnet_Group_UAE
  ]
}