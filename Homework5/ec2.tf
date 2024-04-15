

data "aws_ami" "Ubuntu" {
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

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  #availability_zone = "us-east-2a"
  subnet_id = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  count = 1
  user_data=file("apache1.sh")
  
}

output ec2 {
  value       = aws_instance.web[*].public_ip

}







data "aws_ami" "Ubuntu" {
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

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  #availability_zone = "us-east-2a"
  subnet_id = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  count = 1
  user_data=file("apache1.sh")
  
}

output ec2 {
  value       = aws_instance.web[*].public_ip

}










resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id       = aws_subnet.public1.id
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "Ubuntu"
  }
}

resource "aws_instance" "amazon" {
  ami             = "ami-0c55b159cbfafe1f0"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public2.id
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "Amazon"
  }
}