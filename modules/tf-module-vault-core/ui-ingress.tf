resource "kubernetes_manifest" "vault_ingress" {
  manifest = {
    apiVersion = "networking.k8s.io/v1"
    kind       = "Ingress"
    metadata = {
      name      = "vault-ui"
      namespace = var.namespace
    }
    spec = {
      ingressClassName = "nginx"
      rules = [
        {
          host = var.vault_host
          http = {
            paths = [
              {
                path     = "/"
                pathType = "Prefix"
                backend = {
                  service = {
                    name = "vault"
                    port = {
                      number = 8200
                    }
                  }
                }
              }
            ]
          }
        }
      ]
    }
  }

  depends_on = [helm_release.vault]
}
