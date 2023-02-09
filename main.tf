terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.53.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-06e85d4c3149db26a"
  instance_type = "t2.micro"

  tags = {
    Name = "westVM"
  }
}

resource "aws_instance" "myec2east" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  provider      = aws.east

  tags = {
    Name = "eastVM"
  }
}


output "created_ec2_VMs" {
  value = {
    west = aws_instance.myec2.tags
    west_Time = timestamp()
    east = aws_instance.myec2east.tags
    east_Time = timestamp()

}
}