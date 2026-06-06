resource "helm_release" "cluster_autoscaler" {
  name             = "cluster-autoscaler"
  namespace        = "kube-system"
  create_namespace = true
  repository       = "https://kubernetes.github.io/autoscaler"
  chart            = "cluster-autoscaler"
  version          = "9.57.0"

  values = [file("${path.module}/values/cluster-autoscaler.yaml")]

  set = [
    {
      name  = "autoDiscovery.clusterName"
      value = var.cluster_name
    },
    {
      name  = "awsRegion"
      value = var.region
    },
    {
      name  = "rbac.serviceAccount.name"
      value = var.cluster_autoscaler_service_account_name
    },
  ]

  depends_on = [helm_release.aws_load_balancer_controller]
}
