resource "helm_release" "ingress_controller" {
  name             = "ingress-controller"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  create_namespace = true
  namespace        = "ingress-nginx"

  depends_on = [module.eks_cluster]
}
