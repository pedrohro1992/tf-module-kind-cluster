module "control_plane_cluster" {
  source = "../tf-module-kind-cluster"
  cluster_name = "control-plane"
  enable_ingress_ports = true
  is_cluster_gitops_control_plane = true
  crossplane_control_plane_cluster = true
}

module "argocd" {
  source = "../tf-module-argocd"


  depends_on = [module.control_plane_cluster]
}

module "crossplane_bootstrap" {
  source = "../tf-module-crossplane-app"

  git_repo_url = "http://gitea-server:3000/cacetinho-sa-cloudnative/crossplane-control-plane.git" 
  git_repo_path = "crossplane/install"

  # Garante que o ArgoCD já existe antes de tentar criar a Application
  depends_on = [module.argocd]
}
