provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myawsserver" {
  ami = "ami-0603cbe34fd08cb81"
  instance_type = "t2.micro"

  tags = {
    Name = "Techlanders-aws-ec2-instance"
    Env = "Dev2"
  }
}

module "vpc" {
source = "./modules/app1-vpc"
vpc = "gd-vpc"
}

output "myawsserver-ip" {
  value = aws_instance.myawsserver.public_ip
}
