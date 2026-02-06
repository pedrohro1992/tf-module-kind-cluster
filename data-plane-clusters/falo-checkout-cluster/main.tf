module "checkout" {
  source = "../../tf-module-kind-cluster"
  cluster_name = var.cluster_name
  crossplane_control_plane_cluster = var.crossplane_control_plane_cluster
  is_cluster_data_plane = true
}

module "checkout_argocd_app" {
  source = "../../tf-module-crossplane-app"

  providers = {
    kubernetes = kubernetes.control_plane
  }

  argocd_application_name = "${var.cluster_name}-gitops"
  argocd_application_secret_name = "${var.cluster_name}-gitea-repository"

  git_repo_url = "http://gitea-server:3000/cacetinho-sa-cloudnative/platform-fleet.git" 
  git_repo_path = "clusters/${var.cluster_name}/infra"

  depends_on = [ module.checkout ]
}
