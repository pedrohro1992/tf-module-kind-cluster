
variable "pki_common_name" {
  default = "cacetinho.internal.infra"
}

variable "cert_role_name" {
  default = "k8s-role"
}

variable "cert_manager_policy_name" {
  default = "cert-manager"
}
