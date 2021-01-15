resource "aws_security_group" "example-instance" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-ssh"
  description = "allows ssh and all egress traffic"

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

  tags = {
    Name = "example-instance"
  }
}

resource "aws_security_group" "allow-mariadb" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-mariadb"
  description = "allows mariadb connection"

  ingress {
    from_port       = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.example-instance.id]
    to_port         = 3306
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    self        = true
    to_port     = 0
  }

  tags = {
    Name = "allow-mariadb"
  }
}
