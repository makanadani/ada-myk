resource "kubernetes_secret" "keyvault_secret" {
  metadata {
    name      = "keyvault-secret"
    namespace = "default"
  }

  data = {
    SPD_KEY_VAULT_URI = azurerm_key_vault.keyvault.vault_uri
  }

  type = "Opaque"
}
