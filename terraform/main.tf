terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version ="~> 5.0"
        }
    }
}
provider "aws" {
    region = "us-east-1"
    alias = "security"
}
provider "aws"{
    region = "us-east-1"
    alias = "workload"

    assume_role{
        role_arn = "arn:aws:iam::943193395057:role/OrganizationAccountAccessRole"
    }
}