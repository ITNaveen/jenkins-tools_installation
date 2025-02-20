provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "demo-server" {
    ami = "ami-053a45fff0a704a47"
    instance_type = "t2.micro"
    key_name = "RS_key"  
    security_groups = ["demo-sg"]
    tags = {
      Name = "Test"
    }
}

resource "aws_security_group" "demo-sg" {
  name = "demo-sg"
  description = "SSH-ACCESS"

  ingress {
    description = "Shh-access"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "ssh-port"
  }
}