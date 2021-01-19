resource "aws_security_group" "myinstance" {
  vpc_id      = aws_vpc.main.id
  name        = "myinstance"
  description = "sg for my instance"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "all egress traffic"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh only"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  ingress {
    description     = "http"
    from_port       = 80
    protocol        = "tcp"
    to_port         = 80
    security_groups = [aws_security_group.elb-securitygroup.id]
  }

  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_security_group" "elb-securitygroup" {
  vpc_id      = aws_vpc.main.id
  name        = "elb"
  description = "sg for load balancer"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "all egress traffic"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    description = "http"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elb"
  }
}
