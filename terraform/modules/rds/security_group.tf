resource "aws_security_group" "this" {
  name        = "${var.project_name}-rds-sg"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_eks_cluster" {
  security_group_id            = aws_security_group.this.id
  description                  = "Allow PostgreSQL from EKS nodes"
  referenced_security_group_id = var.eks_cluster_security_group_id
  ip_protocol                  = "tcp"
  from_port                    = 5432
  to_port                      = 5432
}
