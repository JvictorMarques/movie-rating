resource "aws_iam_role" "external_secrets" {
  name               = "${var.project_name}-external-secrets"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

resource "aws_iam_policy" "external_secrets" {
  name = "${var.project_name}-external-secrets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "external_secrets" {
  policy_arn = aws_iam_policy.external_secrets.arn
  role       = aws_iam_role.external_secrets.name
}

resource "aws_eks_pod_identity_association" "external_secrets" {
  cluster_name    = var.cluster_name
  namespace       = "kube-system"
  service_account = var.external_secrets_service_account_name
  role_arn        = aws_iam_role.external_secrets.arn
}
