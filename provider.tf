provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key

  default_tags {
    tags = var.common_tags
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}
