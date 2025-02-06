# Cria uma Service Account para autenticação no Kubernetes.
resource "kubernetes_service_account" "ada_myk_sa" {
  metadata {
    name      = "ada-myk-sa"
    namespace = "default"

    annotations = {
      "azure.workload.identity/client-id" = azurerm_user_assigned_identity.aks_identity.client_id
    }
  }
}
