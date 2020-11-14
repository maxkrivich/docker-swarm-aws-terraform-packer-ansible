resource "aws_key_pair" "ec2_key" {
  key_name   = "public_key"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "swarm_manager" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  count                       = var.cluster_master_count
  associate_public_ip_address = true
  subnet_id                   = local.subnet_ids_list[count.index % length(local.subnet_ids_list)]
  vpc_security_group_ids      = [aws_security_group.swarm_sg.id]
  key_name                    = aws_key_pair.ec2_key.key_name

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags["Name"],
      subnet_id,
    ]
  }

  tags = {
    Name = "${var.vpc_key}-manager-${count.index}"
    VPC  = var.vpc_key
  }
}

resource "aws_instance" "swarm_worker" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  count                       = var.cluster_worker_count
  associate_public_ip_address = true
  subnet_id                   = local.subnet_ids_list[count.index % length(local.subnet_ids_list)]
  vpc_security_group_ids      = [aws_security_group.swarm_sg.id]
  key_name                    = aws_key_pair.ec2_key.key_name

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags["Name"],
      subnet_id,
    ]
  }

  depends_on = [
    aws_instance.swarm_manager
  ]

  tags = {
    Name = "${var.vpc_key}-worker-${count.index}"
    VPC  = var.vpc_key
  }
}
