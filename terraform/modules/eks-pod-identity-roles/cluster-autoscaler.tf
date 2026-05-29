resource "aws_iam_role" "cluster_autoscaler" {
  name               = "${var.project_name}-cluster-autoscaler"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

resource "aws_iam_policy" "cluster_autoscaler" {
  name = "${var.project_name}-cluster-autoscaler"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:DescribeScalingActivities",
          "ec2:DescribeImages",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeLaunchTemplateVersions",
          "ec2:GetInstanceTypesFromInstanceRequirements",
          "eks:DescribeNodegroup"
        ],
        "Resource" : ["*"]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup"
        ],
        "Resource" : ["*"]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_autoscaler" {
  policy_arn = aws_iam_policy.cluster_autoscaler.arn
  role       = aws_iam_role.cluster_autoscaler.name
}

resource "aws_eks_pod_identity_association" "cluster_autoscaler" {
  cluster_name    = var.cluster_name
  namespace       = "kube-system"
  service_account = var.cluster_autoscaler_service_account_name
  role_arn        = aws_iam_role.cluster_autoscaler.arn
}
