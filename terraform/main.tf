provider "aws" {
  region = var.region
}

resource "aws_instance" "kafka" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "Kafka-Server"
  }
}

resource "aws_instance" "redis" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "Redis-Server"
  }
}

resource "aws_instance" "elasticsearch" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "Elasticsearch-Server"
  }
}

resource "aws_security_group" "app_sg" {
  name        = "app_sg"
  description = "Allow inbound access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
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