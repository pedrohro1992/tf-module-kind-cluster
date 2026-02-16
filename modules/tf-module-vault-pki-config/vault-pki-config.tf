resource "vault_mount" "pki" {
  path        = "pki"
  type        = "pki"
  max_lease_ttl_seconds = 315360000
}

resource "vault_pki_secret_backend_root_cert" "root" {
  backend     = vault_mount.pki.path
  type        = "internal"
  common_name = var.pki_common_name
  ttl         = "87600h"
}

resource "vault_pki_secret_backend_config_urls" "urls" {
  backend = vault_mount.pki.path

  issuing_certificates    = ["http://vault.vault.svc:8200/v1/pki/ca"]
  crl_distribution_points = ["http://vault.vault.svc:8200/v1/pki/crl"]
}

resource "vault_pki_secret_backend_role" "role" {
  backend          = vault_mount.pki.path
  name             = var.cert_role_name
  allowed_domains  = ["local"]
  allow_subdomains = true
  max_ttl          = "72h"
}

