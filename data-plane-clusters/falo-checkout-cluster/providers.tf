provider "kind" {}

provider "kubernetes" {
  alias          = "control_plane"
  config_path    = "~/.kube/config"
  config_context = var.crossplane_control_plane_cluster 
}
