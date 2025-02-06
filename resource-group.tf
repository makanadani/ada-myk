# Cria o Resource Group onde todos os recursos serão implantados.
resource "azurerm_resource_group" "environment_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
