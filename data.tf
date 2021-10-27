terraform {
  backend "s3" {
    bucket = "terraform-state-rs-practice"
    key    = "rs-instances/test.tfstate"
    region = "us-east-1"
  }
}

#Centos-7-DevOps-Practice - ami-059e6ca6474628ef0

data "aws_ami" "AMI" {
    most_recent = true
    owners = ["973714476881"]
    filter {
        name = "name"
        values = ["Centos-7-DevOps-Practice"]
    }
}

data "aws_route53_zone" "jithendar" {
  name = "jithendar.com"
  private_zone = false
}