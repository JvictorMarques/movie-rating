resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "9.5.15"

  values = [file("${path.module}/values/argocd.yaml")]

  depends_on = [helm_release.aws_load_balancer_controller]
}
