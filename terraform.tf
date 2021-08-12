terraform {
  required_version = ">=1.0.0"

  backend "remote" {
    organization = "faiiinttt-tf-organization"
    workspaces {
      name = "tf-eks"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.48.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.4.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~>2.2.0"
    }
  }
}
