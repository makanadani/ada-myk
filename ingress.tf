resource "kubernetes_ingress_v1" "ada_myk_ingress" {
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
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.ada_myk_service.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}