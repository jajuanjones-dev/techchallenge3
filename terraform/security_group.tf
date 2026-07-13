resource "aws_security_group" "web_sg" {
  name        = "techchallenge3-web-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH from anywhere (tighten later if you want)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "techchallenge3-web-sg"
  }
}
