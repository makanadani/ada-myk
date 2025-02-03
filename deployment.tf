resource "kubernetes_deployment" "ada_myk_deployment" {
  metadata {
    name      = "ada-myk-deployment"
    namespace = var.kubernetes_namespace
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "ada-myk"
      }
    }

    template {
      metadata {
        labels = {
          app = "ada-myk"
        }
      }

      spec {
        container {
          name  = "ada-myk-container"
          image = "schwendler/embarque-ti-spd-project"
          ports {
            container_port = 8080
          }
          env {
            name = "SPD_KEY_VAULT_URI"
            value_from {
              secret_key_ref {
                name = "keyvault-secret"
                key  = "SPD_KEY_VAULT_URI"
              }
            }
          }
          env {
            name = "DB_CONNECTION_STRING"
            value_from {
              secret_key_ref {
                name = "db-connection-string"
                key  = "connection-string"
              }
            }
          }
        }
      }
    }
  }
}