resource "helm_release" "external_secrets" {
  name             = "external-secrets"
  namespace        = "kube-system"
  create_namespace = true
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  version          = "2.5.0"

  values = [file("${path.module}/values/external-secrets.yaml")]

  set = [
    {
      name  = "serviceAccount.name"
      value = var.external_secrets_service_account_name
    },
  ]

  depends_on = [helm_release.aws_load_balancer_controller]
}
