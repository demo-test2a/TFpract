provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "172.31.0.0/24"
  tags = {
    Name = "Mydemovpc"
  }
}

resource "aws_security_group" "mysg" {
  description = "Setting Traffic rule"
  vpc_id = "${aws_vpc.myvpc.id}"
  tags = {
    Name = "Mydemosg"
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
