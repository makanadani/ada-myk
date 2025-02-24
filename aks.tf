# Provisiona o cluster **Azure Kubernetes Service (AKS)**, incluindo **namespace** dedicado à aplicação.
resource "azurerm_kubernetes_cluster" "k8s" {
  name                    = var.aks_cluster_name
  location                = azurerm_resource_group.environment_rg.location
  resource_group_name     = azurerm_resource_group.environment_rg.name
  dns_prefix              = var.dns_prefix
  kubernetes_version      = var.kubernetes_version

  default_node_pool {
    name            = "agentpool"
    node_count      = var.agent_count
    vm_size         = var.vm_size
    vnet_subnet_id  = azurerm_subnet.cluster_resources.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    service_cidr       = "10.2.0.0/16"
    dns_service_ip     = "10.2.0.10"
  }
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = var.kubernetes_namespace
  }
}