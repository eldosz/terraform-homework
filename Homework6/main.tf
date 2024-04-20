provider aws {
    region = var.region
}



resource "aws_key_pair" "deployer" {
  key_name   = "hello"
  public_key = file ("~/.ssh/id_rsa.pub")
}







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
  instance_type = var.type
  user_data=file("apache.sh")

}


output ubuntu_ec2 {
  value       = aws_instance.ubuntu_instance.public_ip

}