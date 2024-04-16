

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type_and_name[0].in_type
  subnet_id              = aws_subnet.public1.id 
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data=file("apache.sh")
    tags={
    Name=var.instance_type_and_name[0].in_name

  }
}



output ubuntu_ec2 {
  value       = aws_instance.ubuntu_instance.public_ip

}



data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}


resource "aws_instance" "amazon_instance" {
  ami                    = data.aws_ami.amazon.id
  instance_type          = var.instance_type_and_name[0].in_type
  subnet_id              = aws_subnet.public1.id  
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data=file("apache2.sh")
  
 tags={
    Name=var.instance_type_and_name[1].in_name

 }
  }
output amazon_ec2 {
  value       = aws_instance.amazon_instance.public_ip

}














