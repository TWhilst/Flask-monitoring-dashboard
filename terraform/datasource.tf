/// Vpc id variable
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

data "aws_ami" "linux_ami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.7.20250512.0-kernel-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
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

data "aws_security_group" "Project1_sg_jenkins" {
    name   = "main-sg-jenkins"
}

data "aws_security_group" "Project1_sg_http" {
    name   = "main-sg-http"
}

