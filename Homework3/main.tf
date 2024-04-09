
provider "aws" {
  region = "us-west-2"
}


data "aws_ami" "name1" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}



resource "aws_instance" "homework3" {
  count         = 3
  ami           = data.aws_ami.name1.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.hw3-sg.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.bastion.key_name

}