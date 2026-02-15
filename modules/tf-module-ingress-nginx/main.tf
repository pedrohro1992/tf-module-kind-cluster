resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  namespace  = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.10.0"

  create_namespace = true

  values = [
    yamlencode({
      controller = {

        replicaCount = 1

        nodeSelector = {
          "node-role.kubernetes.io/control-plane" = ""
        }

        tolerations = [
          {
            key      = "node-role.kubernetes.io/control-plane"
            operator = "Exists"
            effect   = "NoSchedule"
          }
        ]

        service = {
          type = "NodePort"
          nodePorts = {
            http  = 30080
            https = 30443
          }
        }

        resources = {
          requests = {
            cpu    = "50m"
            memory = "64Mi"
          }
          limits = {
            cpu    = "200m"
            memory = "256Mi"
          }
        }

        metrics = {
          enabled = false
        }
      }
    })
  ]
}
