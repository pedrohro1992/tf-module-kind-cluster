output "kubernetes_auth_backend_path" {
  value = vault_auth_backend.kubernetes.path
}

output "cert_role_name" {
  value = vault_pki_secret_backend_role.role.name
}

output "policy_name" {
  value = vault_policy.cert_manager.name
}
