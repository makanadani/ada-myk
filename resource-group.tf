resource "azurerm_resource_group" "environment_rg" {
  name     = "rg-projetoada-myk"
  location = var.resource_group_location
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}