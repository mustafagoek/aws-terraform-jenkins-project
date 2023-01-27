terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "2.36.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
data "template_file" "userdata" {
  template = file("${abspath(path.module)}/userdata.sh")
}

 resource "aws_instance" "vm1" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.HTTPandSSH.id]
  user_data = data.template_file.userdata.rendered
  key_name = "dockerkey"
 }

 resource "aws_security_group" "HTTPandSSH" {
  name        = "HTTPandSSH"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    description      = "allow HTTP"
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "allow SSH"
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "allow Jenkins"
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "allow 50000"
    to_port          = 50000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

