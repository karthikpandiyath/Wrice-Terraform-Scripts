terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
     profile = "default"
     region = var.region_HK
     alias = "hongkong"
}

provider "aws" {
     profile = "default"
     region = var.region_SG
     alias = "singapore"
}

provider "aws" {
     profile = "default"
     region = var.region_UAE
     alias = "uae"
}