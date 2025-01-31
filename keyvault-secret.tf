resource "kubernetes_secret" "keyvault_secret" {
  metadata {
    name      = "keyvault-secret"
    namespace = "default"
  }

  data = {
    SPD_KEY_VAULT_URI = "https://kv-ada-myk.vault.azure.net/"
  }

  type = "Opaque"
}
