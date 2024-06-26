provider "aws" {
  region = "us-west-2"
}
  
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  owners = ["amazon"]
}





resource "aws_instance" "homework3" {
  count                      = 3
  ami                        = data.aws_ami.ubuntu.id
  instance_type              = "t2.micro"
  vpc_security_group_ids     = [aws_security_group.hw3-sg.id]
  associate_public_ip_address = true
  key_name                   = aws_key_pair.bastion1.key_name

  user_data                  = file("apache.sh")
  user_data_replace_on_change = true
  tags = {
    Name = "web-${count.index + 1}"
  }
}

output "instance_public_ips" {
  value = aws_instance.homework3[*].public_ip
}
