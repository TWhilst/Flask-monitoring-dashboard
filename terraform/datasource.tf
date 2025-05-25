/// Vpc id variable
variable "vpc_id" {
    type     = string
    default  = "vpc-0b16e539a6d9d52b8"
    description = "main VPC ID"
}

data "aws_vpc" "Project1" {
  id                = var.vpc_id
}

/// Aws Ami Datasource
data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners          = ["099720109477"]

  filter {
    name            = "name"
    values          = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

}

/// Aws Subnet Datasource
data "aws_subnet" "public_subnet" {

  vpc_id = data.aws_vpc.Project1.id
  tags = {
    Name = "main-public"
  }
  
  filter {
    name   = "state"
    values = ["available"]
  }
}

output "public_subnet_id" {
  value = data.aws_subnet.public_subnet.id
}

/// Aws Security Group Datasource
data "aws_security_group" "Project1_sg_ssh" {
    name   = "main-sg-ssh"
}

data "aws_security_group" "Project1_sg_http" {
    name   = "main-sg-http"
}

