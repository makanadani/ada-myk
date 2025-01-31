resource "kubernetes_deployment" "ada_myk" {
  metadata {
    name      = "ada-myk"
    namespace = "default"

    annotations = {
      "azure.workload.identity/use" = "true"
    }

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

    template {
      metadata {
        labels = {
          app = "ada-myk"
        }

        annotations = {
          "azure.workload.identity/use" = "true"
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
        }
      }
    }
  }
}
