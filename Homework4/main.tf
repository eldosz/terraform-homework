provider aws {
region = var.region
}

resource "aws_instance" "web" {
  ami = var.ami_id
  count = var.count_var
  key_name  = aws_key_pair.web.key_name
  instance_type = var.type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone = var.availability_zone
}



resource "aws_key_pair" "web" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  ingress {
    from_port   = var.ports[0]
    to_port     = var.ports[1]
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


variable region {
  description = "aws region"
  default = ""
  type = string
}

variable key_name {
  description = "Name of the SSH key pair"
  type = string
}

variable ports {
  description = "ports"
  default     = [22, 80, 443]
}

variable availability_zone {
  description = "av zone for the EC2 instance"
  type = string
}

variable type {
  description = "type of EC2 instance"
  type = string
}

variable ami_id {
  description = "id of the AMI to use for the EC2 instance"
  type = string
}

variable count_var {
  description = "number of EC2 instances to create"
  type        = number


}










