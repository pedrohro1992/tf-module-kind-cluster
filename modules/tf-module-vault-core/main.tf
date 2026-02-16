resource "helm_release" "vault" {
  name       = "vault"
  namespace  = kubernetes_namespace.vault.metadata[0].name
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.27.0"

  values = [
    yamlencode({
      injector = {
        enabled = false
      }

      server = {
        replicas = 0

        ha = {
          enabled = true
          raft = {
            enabled = true
          }
        }

        dataStorage = {
          enabled      = true
          size         = "5Gi"
          storageClass = var.storage_class
        }

        ui = {
          enabled = true
        }

        nodeSelector = var.node_selector

        affinity = {}

        resources = {
          requests = {
            cpu    = "200m"
            memory = "256Mi"
          }
          limits = {
            cpu    = "500m"
            memory = "512Mi"
          }
        }
      }
    })
  ]
}
