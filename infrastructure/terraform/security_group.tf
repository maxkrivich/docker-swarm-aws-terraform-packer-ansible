resource "aws_security_group" "swarm_sg" {
  name        = "${var.vpc_key}-sg-swarm"
  description = "Security group for swarm cluster instances"
  vpc_id      = aws_vpc.swarm_vpc.id

  dynamic "ingress" {
    for_each = ["80", "8080", "2377", "7946", "4789"]

    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      cidr_blocks = [
        aws_vpc.swarm_vpc.cidr_block
      ]
    }
  }

  dynamic "ingress" {
    for_each = ["7946"]

    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "udp"
      cidr_blocks = [
        aws_vpc.swarm_vpc.cidr_block
      ]
    }
  }


  dynamic "ingress" {
    for_each = ["22", "80", "8080"]

    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      cidr_blocks = [
        "0.0.0.0/0"
      ]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_key}-sg-swarm"
    VPC  = var.vpc_key
  }
}
