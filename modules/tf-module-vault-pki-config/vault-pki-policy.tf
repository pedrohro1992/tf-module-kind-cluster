resource "vault_policy" "cert_manager" {
  name = var.cert_manager_policy_name

  policy = <<EOT
path "pki/sign/${var.cert_role_name}" {
  capabilities = ["update"]
}

path "pki/issue/${var.cert_role_name}" {
  capabilities = ["update"]
}
EOT
}

# Auth Kubernetes habilitado (sem config)
resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

# Role vinculada ao SA (policy já criada aqui)
resource "vault_kubernetes_auth_backend_role" "cert_manager" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "cert-manager"

  bound_service_account_names      = ["cert-manager"]
  bound_service_account_namespaces = ["cert-manager"]

  token_policies = [vault_policy.cert_manager.name]
  token_ttl      = 86400
}
