resource "kubernetes_service" "ada_myk_service" {
  metadata {
    name      = "ada-myk-service"
    namespace = var.kubernetes_namespace
  }

  spec {
    selector = {
      app = "ada-myk"
    }

    port {
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
    }
  }
}
