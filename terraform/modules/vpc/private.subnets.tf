resource "aws_subnet" "private" {
  count = length(local.subnets_azs)

  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + length(local.subnets_azs))
  availability_zone = local.subnets_azs[count.index]

  map_public_ip_on_launch = false

  tags = {
    Name                              = "${var.project_name}-private-${substr(local.subnets_azs[count.index], -2, 2)}"
    "kubernetes.io/role/internal-elb" = "1"
  }
}
