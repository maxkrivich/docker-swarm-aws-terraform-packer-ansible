data "aws_subnet_ids" "subnets" {
    vpc_id = aws_vpc.swarm_vpc.id
}

locals {
    subnet_ids_list = tolist(data.aws_subnet_ids.subnets.ids)
}