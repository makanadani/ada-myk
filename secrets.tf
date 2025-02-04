resource "kubernetes_secret" "db_secret" {
  metadata {
    name      = "db-connection-string"
    namespace = var.kubernetes_namespace
  }

  data = {
    connection-string = base64encode(azurerm_key_vault_secret.db_connection_string.value)
  }

  type = "Opaque"
}
