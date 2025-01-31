resource "kubernetes_service" "ada_myk_service" {
  metadata {
    name      = "ada-myk-service"
    namespace = "default"
    labels = {
      app = "ada-myk"
    }
  }

  spec {
    selector = {
      app = "ada-myk"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
