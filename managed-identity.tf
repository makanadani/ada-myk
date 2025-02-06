# Cria uma Managed Identity para a aplicação acessar recursos sem credenciais explícitas, incluindo permissões necessárias para acesso aos recursos.
resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "aks-workload-identity"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  depends_on = [azurerm_resource_group.environment_rg]
}

resource "azurerm_role_assignment" "aks_keyvault_access" {
  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_kubernetes_cluster.k8s.identity[0].principal_id
}