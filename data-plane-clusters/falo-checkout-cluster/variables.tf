variable "cluster_name" {
  description = "Nome do cluster"
  type = string
  default = "falo-checkout-cluster"
}

variable "crossplane_control_plane_cluster" {
  description = "Nome do cluster onde o control-plane do crossplane esta rodando"
  type = string
  default = "kind-control-plane"
}

