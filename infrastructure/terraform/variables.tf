variable "region" {
  description = "AWS region on which we will setup the swarm cluster"
  default     = "us-east-1"
}

variable "instance_ami" {
  description = "Amazon Linux AMI"
  default     = "ami-0370b9ba746acd862"
}

variable "instance_type" {
  description = "Type for aws EC2 instance"
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "SSH Public Key path"
  default     = "~/.ssh/id_rsa.pub"
}

variable "vpc_key" {
  description = "A unique identifier for the VPC."
  default     = "mkryvy"
}

variable "cluster_master_count" {
  description = "Number of master instances for the cluster."
  default     = 1
}

variable "cluster_worker_count" {
  description = "Number of node instances for the cluster."
  default     = 2
}
