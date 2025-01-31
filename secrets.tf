resource "azurerm_key_vault_secret" "db_connection_string" {
  name         = "db-connection-string"
  value        = var.sql_admin_password
  key_vault_id = azurerm_key_vault.keyvault.id
}

resource "kubernetes_secret" "db_secret" {
  metadata {
    name      = "db-connection-string"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }

  data = {
    connection-string = azurerm_key_vault_secret.db_connection_string.value
  }
}