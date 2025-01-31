resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "aks-workload-identity"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  depends_on = [ var.resource_group_name ]
}
