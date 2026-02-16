variable "namespace" {
  default = "vault"
}

variable "storage_class" {
  default = "openebs-hostpath"
}

variable "vault_host" {
  default = "vault.cacetinho.internal.infra"
}

variable "node_selector" {
  type = map(string)
  default = {
    storage = "enabled"
  }
}
