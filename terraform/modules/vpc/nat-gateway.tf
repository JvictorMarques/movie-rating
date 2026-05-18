resource "aws_nat_gateway" "this" {
  vpc_id            = aws_vpc.this.id
  availability_mode = "regional"

  depends_on = [aws_internet_gateway.this]
}
