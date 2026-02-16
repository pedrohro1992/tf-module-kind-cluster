terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.10.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.1.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}
