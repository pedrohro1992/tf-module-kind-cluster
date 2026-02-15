resource "kubernetes_storage_class" "openebs_local" {
  metadata {
    name = "openebs-local"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }

  storage_provisioner = "openebs.io/local"
  reclaim_policy      = "Retain"
  volume_binding_mode = "WaitForFirstConsumer"

  parameters = {
    storageType = "hostpath"
    basePath    = "/var/openebs"
  }

  depends_on = [
    helm_release.openebs
  ]
}
