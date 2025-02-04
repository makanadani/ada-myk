resource "kubernetes_ingress" "ada_myk_ingress" {
  metadata {
    name      = "ada-myk-ingress"
    namespace = var.kubernetes_namespace

    annotations = {
      "kubernetes.io/ingress.class" = "webapprouting.kubernetes.azure.com"
    }
  }

  spec {
    rule {
      host = "myk.com"

      http {
        path {
          path = "/"
          backend {
            service_name = kubernetes_service.ada_myk_service.metadata[0].name
            service_port = 80
          }
        }
      }
    }
  }
}