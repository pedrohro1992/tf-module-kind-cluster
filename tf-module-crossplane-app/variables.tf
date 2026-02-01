variable "target_namespace" {
  type        = string
  default     = "crossplane-system"
  description = "Namespace onde o Crossplane será instalado pelo ArgoCD"
}

variable "git_repo_url" {
  type        = string
  description = "URL do seu repositório Git local/remoto onde estão os YAMLs do Crossplane"
}

variable "git_repo_path" {
  type        = string
  default     = "crossplane/install"
  description = "Caminho dentro do Git onde está o Helm ou YAMLs do Crossplane"
}
