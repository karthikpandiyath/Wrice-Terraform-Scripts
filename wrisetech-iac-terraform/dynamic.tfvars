### Region ###
region_HK = "ap-south-1" #mumbai
region_UAE = "us-east-1" #us
region_SG = "ap-southeast-1" #Singapore
environment = "prod"
#availability_zone = ["ap-south-1a","ap-south-1b"]
### VPC ###
#count = length(var.vpcs[*][subnets"][*])
vpcs_hongkong = [
    {
        "name" = "Prod-HK-Spoke-VPC"
        "cidr_block" = "10.0.1.0/24"
    }
]

vpcs_uae = [
    {
        "name" = "Prod-UAE-Spoke-VPC"
        "cidr_block" = "10.0.2.0/24"
    }
]

vpcs_singapore = [
    {
        "name" = "Prod-SNG-Spoke-VPC"
        "cidr_block" = "10.0.0.0/24"  
    },
    {
        "name" = "Prod-Egress-VPC"
        "cidr_block" = "10.0.4.0/24"
    },
    {
        "name" = "Prod-Firewall-VPC"
        "cidr_block" = "10.0.3.0/24"
    }
]
### Subnet Vars ###

private_subnets_singapore = [
    {
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "subnet_name" = "prod-spoke-pri-app-az1"
        "availability_zone" = "ap-southeast-1a"
        "CIDR" = "10.0.0.0/27"
    },
    {   
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "subnet_name" = "prod-spoke-pri-app-az2"
        "availability_zone" = "ap-southeast-1b"
        "CIDR" = "10.0.0.32/27"
    },
    {
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "subnet_name" = "prod-spoke-pri-eks-az1"
        "availability_zone" = "ap-southeast-1a"
        "CIDR" = "10.0.0.64/27"
    },
    {
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "subnet_name" = "prod-spoke-pri-eks-az2"
        "availability_zone" = "ap-southeast-1b"
        "CIDR" = "10.0.0.96/27"
    },
    {
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "subnet_name" = "prod-spoke-pri-db-az1"
        "availability_zone" = "ap-southeast-1a"
        "CIDR" = "10.0.0.128/27"
    },
    {
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "subnet_name" = "prod-spoke-pri-db-az2"
        "availability_zone" = "ap-southeast-1b"
        "CIDR" = "10.0.0.160/27"
    },
    {
        "vpc_name" = "Prod-Firewall-VPC"
        "subnet_name" = "prod-firewall-pri-AZ1"
        "availability_zone" = "ap-southeast-1a"
        "CIDR" = "10.0.3.0/25"
    },
    {
        "vpc_name" = "Prod-Firewall-VPC"
        "subnet_name" = "prod-firewall-pri-AZ2"
        "availability_zone" = "ap-southeast-1b"
        "CIDR" = "10.0.3.128/25"
    }
] 

private_subnets_hongkong=[
    {
        "vpc_name" = "Prod-HK-Spoke-VPC"
        "subnet_name" = "prod-hk-spoke-pri-db-az1"
        "availability_zone" = "ap-south-1a"#replace with ap-east-1(HK) availability zone
        "CIDR" = "10.0.1.0/25"
    },
    {
        "vpc_name" = "Prod-HK-Spoke-VPC"
        "subnet_name" = "prod-hk-spoke-pri-db-az2"
        "availability_zone" = "ap-south-1b"#replace with ap-east-1(HK) availability zone
        "CIDR" = "10.0.1.128/25"
    }
]

private_subnets_uae=[
    {
        "vpc_name" = "Prod-UAE-Spoke-VPC"
        "subnet_name" = "prod-uae-spoke-pri-db-az1"
        "availability_zone" = "us-east-1a"#replace with UAE availability zone
        "CIDR" = "10.0.2.0/25"
    },
    {
        "vpc_name" = "Prod-UAE-Spoke-VPC"
        "subnet_name" = "prod-uae-spoke-pri-db-az2"
        "availability_zone" = "us-east-1b"#replace with UAE availability zone
        "CIDR" = "10.0.2.128/25"
    }
]

public_subnets_singapore = [
    {
        "vpc_name" = "Prod-Egress-VPC"
        "subnet_name" = "prod-egress-pub-az1"
        "availability_zone" = "ap-southeast-1a"
        "CIDR" = "10.0.4.0/25"
    },
    {
        "vpc_name" = "Prod-Egress-VPC"
        "subnet_name" = "prod-egress-pub-az2"
        "availability_zone" = "ap-southeast-1b"
        "CIDR" = "10.0.4.128/25"
    }
]

#### RDS ####

db_instance_singapore = [
    {
        "db_name" = "prod-sng-master-db"
        "db_subnet_grp_name"= "prod-sng-master-db-subnet-grp"
        "allocated_storage" = 100
        "engine" = "MySQL"
        "engine_version" = "8.0.27"
        "instance_class" = "db.t3.micro"
        "username"  = "rdsuser"
        "password"  = "rdsuser123"
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "subnet_name" = ["prod-spoke-pri-db-az1","prod-spoke-pri-db-az2"]
    }
]

db_instance_hongkong = [
    {
        "db_name" = "prod-hk-db"
        "db_subnet_grp_name"= "prod-hk-spoke-pri-db-subnet-grp"
        "allocated_storage" = 100
        "engine" = "MySQL"
        "engine_version" = "8.0.27"
        "instance_class" = "db.t3.micro"
        "username"  = "rdsuser"
        "password"  = "rdsuser123"
        "vpc_name" = "Prod-HK-Spoke-VPC"
        "subnet_name" = ["prod-hk-spoke-pri-db-az1","prod-hk-spoke-pri-db-az2"]
    }
]

db_instance_uae = [
    {
        "db_name" = "prod-uae-db"
        "db_subnet_grp_name"= "prod-uae-db-subnet-grp"
        "allocated_storage" = 100
        "engine" = "MySQL"
        "engine_version" = "8.0.27"
        "instance_class" = "db.t3.micro"
        "username"  = "rdsuser"
        "password"  = "rdsuser123"
        "vpc_name" = "Prod-UAE-Spoke-VPC"
        "subnet_name" = ["prod-uae-spoke-pri-db-az1","prod-uae-spoke-pri-db-az2"]
    }
]
### EC2 ###
# ec2_instance = [
#     {
#         ec2_name = "Image-server"
#         instance_type = "m5.2xlarge"
#         ec2_ami_id = "ami-0c6615d1e95c98aca"
#         "availability_zone" = "ap-south-1a"
#         }
#     ]

### demo ####

### NACL Vars ###
nacl_singapore=[
    {
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "acl_name" = "prod-spoke-pri-app-acl"
        "subnet_name" = ["prod-spoke-pri-app-az1","prod-spoke-pri-app-az2"]
        "egress_protocol" = "-1"
        "egress_rule_no" = 32751
        "egress_action" = "allow"
        "egress_cidr" = "0.0.0.0/0"
        "egress_from_port" = 0
        "egress_to_port" = 0
        "ingress_protocol" = "-1"
        "ingress_rule_no" = 32751
        "ingress_action" = "allow"
        "ingress_cidr" = "0.0.0.0/0"
        "ingress_from_port" = 0
        "ingress_to_port" = 0
        "destination_cidr_block" = "10.0.0.0/24"
    },
    {
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "acl_name" = "prod-spoke-pri-db-acl"
        "subnet_name" = ["prod-spoke-pri-db-az1","prod-spoke-pri-db-az2"]
        "egress_protocol" = "-1"
        "egress_rule_no" = 32751
        "egress_action" = "allow"
        "egress_cidr" = "0.0.0.0/0"
        "egress_from_port" = 0
        "egress_to_port" = 0
        "ingress_protocol" = "-1"
        "ingress_rule_no" = 32751
        "ingress_action" = "allow"
        "ingress_cidr" = "0.0.0.0/0"
        "ingress_from_port" = 0
        "ingress_to_port" = 0
        "destination_cidr_block" = "10.0.0.0/24"
    },
    {
        "vpc_name" = "Prod-SNG-Spoke-VPC"
        "acl_name" = "prod-spoke-pri-eks-acl"
        "subnet_name" = ["prod-spoke-pri-eks-az1","prod-spoke-pri-eks-az2"]
        "egress_protocol" = "-1"
        "egress_rule_no" = 32751
        "egress_action" = "allow"
        "egress_cidr" = "0.0.0.0/0"
        "egress_from_port" = 0
        "egress_to_port" = 0
        "ingress_protocol" = "-1"
        "ingress_rule_no" = 32751
        "ingress_action" = "allow"
        "ingress_cidr" = "0.0.0.0/0"
        "ingress_from_port" = 0
        "ingress_to_port" = 0
        "destination_cidr_block" = "10.0.0.0/24"
    },
    {
        "vpc_name" = "Prod-Egress-VPC"
        "acl_name" = "prod-egress-pub-acl"
        "subnet_name" = ["prod-egress-pub-az1","prod-egress-pub-az2"]
        "egress_protocol" = "-1"
        "egress_rule_no" = 32751
        "egress_action" = "allow"
        "egress_cidr" = "0.0.0.0/0"
        "egress_from_port" = 0
        "egress_to_port" = 0
        "ingress_protocol" = "-1"
        "ingress_rule_no" = 32751
        "ingress_action" = "allow"
        "ingress_cidr" = "0.0.0.0/0"
        "ingress_from_port" = 0
        "ingress_to_port" = 0
        "destination_cidr_block" = "10.0.0.0/24"
    },
    {
        "vpc_name" = "Prod-Firewall-VPC"
        "acl_name" = "prod-firewall-acl"
        "subnet_name" = ["prod-firewall-pri-AZ1","prod-firewall-pri-AZ2"]
        "egress_protocol" = "-1"
        "egress_rule_no" = 32751
        "egress_action" = "allow"
        "egress_cidr" = "0.0.0.0/0"
        "egress_from_port" = 0
        "egress_to_port" = 0
        "ingress_protocol" = "-1"
        "ingress_rule_no" = 32751
        "ingress_action" = "allow"
        "ingress_cidr" = "0.0.0.0/0"
        "ingress_from_port" = 0
        "ingress_to_port" = 0
        "destination_cidr_block" = "10.0.0.0/24"
    }
]

nacl_uae=[
    {
        "vpc_name" = "Prod-UAE-Spoke-VPC"
        "acl_name" = "prod-uae-spoke-pri-db-acl"
        "subnet_name" = ["prod-uae-spoke-pri-db-az1","prod-uae-spoke-pri-db-az2"]
        "egress_protocol" = "-1"
        "egress_rule_no" = 32751
        "egress_action" = "allow"
        "egress_cidr" = "0.0.0.0/0"
        "egress_from_port" = 0
        "egress_to_port" = 0
        "ingress_protocol" = "-1"
        "ingress_rule_no" = 32751
        "ingress_action" = "allow"
        "ingress_cidr" = "0.0.0.0/0"
        "ingress_from_port" = 0
        "ingress_to_port" = 0
        "destination_cidr_block" = "10.0.0.0/24"
    }
]

nacl_hongkong=[
    {
        "vpc_name" = "Prod-HK-Spoke-VPC"
        "acl_name" = "prod-hk-spoke-pri-db-acl"
        "subnet_name" = ["prod-hk-spoke-pri-db-az1","prod-hk-spoke-pri-db-az2"]
        "egress_protocol" = "-1"
        "egress_rule_no" = 32751
        "egress_action" = "allow"
        "egress_cidr" = "0.0.0.0/0"
        "egress_from_port" = 0
        "egress_to_port" = 0
        "ingress_protocol" = "-1"
        "ingress_rule_no" = 32751
        "ingress_action" = "allow"
        "ingress_cidr" = "0.0.0.0/0"
        "ingress_from_port" = 0
        "ingress_to_port" = 0
        "destination_cidr_block" = "10.0.0.0/24"
    }
]

# egress_protocol = "tcp"
# egress_rule_no = 200
# egress_action = "allow"
# egress_cidr = "0.0.0.0/0"
# egress_from_port = 443
# egress_to_port = 443
# ingress_protocol = "tcp"
# ingress_rule_no = 100
# ingress_action = "allow"
# ingress_cidr = "0.0.0.0/0"
# ingress_from_port = 80
# ingress_to_port = 80
# destination_cidr_block = "0.0.0.0/0"
### Route Table ###
# rt_name = "public_rt"
# pvt_rt_name = "private_rt"
# route_cidr = "0.0.0.0/0"
#### EIP ####
# eip_name = "Prod-egress-nat-eip"
##### NAT Vars ######
#  nat_gateway_name = "Prod-Egress-NAT-Gateway"
#  nat_subnets=[
#      {
#         "vpc_name" = "Prod-Egress-VPC"
#         "subnet_name" = ["prod-egress-pub-az1","prod-egress-pub-az2"]
#      }
#  ]

