resource "aws_subnet" "public" {
  count = length(local.subnets_azs)

  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index)
  availability_zone = local.subnets_azs[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name                     = "${var.project_name}-public-${substr(local.subnets_azs[count.index], -2, 2)}"
    "kubernetes.io/role/elb" = "1"
  }
}
