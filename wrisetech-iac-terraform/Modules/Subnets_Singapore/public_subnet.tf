data "aws_vpc" "vpc_publicSubnets" {
  count = length(var.public_subnets_singapore[*])
  filter {
    name = "tag:Name"
    values = [element(var.public_subnets_singapore[*]["vpc_name"],count.index)]
  }
}

locals {
  vpc_id_public = data.aws_vpc.vpc_publicSubnets.*.id
}

#Public Subnet Creation
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets_singapore[*])
  vpc_id     = element(local.vpc_id_public,count.index)
  cidr_block = element(var.public_subnets_singapore[*]["CIDR"],count.index)
  availability_zone = element(var.public_subnets_singapore[*]["availability_zone"],count.index)
  map_public_ip_on_launch = true
  tags = {
    Name  = format("%s",element(var.public_subnets_singapore[*]["subnet_name"],count.index))
    Environment = var.environment
  }
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.*.id
}