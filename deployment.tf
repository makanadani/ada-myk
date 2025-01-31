resource "kubernetes_deployment" "ada_myk" {
  metadata {
    name      = "ada-myk"
    namespace = "default"
    labels = {
      app = "ada-myk"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "ada-myk"
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = 1
        max_unavailable = 1
      }
    }

    template {
      metadata {
        labels = {
          app = "ada-myk"
          azure.workload.identity/use = "true"
        }
      }

      spec {
        service_account_name = "ada-myk-sa"

        container {
          name  = "ada-myk"
          image = "schwendler/embarque-ti-spd-project"

          port {
            container_port = 8080
          }

          env {
            name = "SPD_KEY_VAULT_URI"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.keyvault_secret.metadata[0].name
                key  = "SPD_KEY_VAULT_URI"
              }
            }
          }
        }
      }
    }
  }
}
