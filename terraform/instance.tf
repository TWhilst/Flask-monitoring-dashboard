resource "aws_instance" "ansible_instance" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t2.micro"
  key_name      = "toche-key1"
  subnet_id     = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [data.aws_security_group.Project1_sg_ssh.id, data.aws_security_group.Project1_sg_http.id]
  user_data = file("~/.vscode/Flask-monitoring-dashboard/ansible.sh")

  tags = {
    Name = "project5_ansible"
  }
}

resource "aws_instance" "deploy_server" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t2.micro"
  key_name      = "toche-key1"
  subnet_id     = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [data.aws_security_group.Project1_sg_ssh.id, data.aws_security_group.Project1_sg_http.id, aws_security_group.Project1_sg_flask.id]

  tags = {
    Name = "flask_deploy_server"
  }
}