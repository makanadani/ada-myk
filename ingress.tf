
# Professor, sei que o problema deve ser aqui, mas não consegui resolver. Não sei como fazer a aplicação rodar na porta 8080.

# Define os dados do ingress
resource "kubernetes_ingress_v1" "ada_myk_ingress" {
  metadata {
    name      = "ada-myk-ingress"
    namespace = var.kubernetes_namespace

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      host = "myk.com"

      http {
        path {
          path     = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.ada_myk_service.metadata[0].name
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}
