resource "aws_security_group" "Project1_sg_flask" {
  name        = "main-sg-flask"
  description = "allow flask app access"
  vpc_id      = data.aws_vpc.Project1.id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}