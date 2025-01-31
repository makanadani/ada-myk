resource "azurerm_kubernetes_cluster" "k8s" {
  name                    = var.aks_cluster_name
  location                = azurerm_resource_group.environment_rg.location
  resource_group_name     = azurerm_resource_group.environment_rg.name
  dns_prefix              = var.dns_prefix
  private_cluster_enabled = false
  kubernetes_version      = var.kubernetes_version

  role_based_access_control_enabled = true

  default_node_pool {
    name            = "agentpool"
    os_disk_size_gb = 50
    type            = "VirtualMachineScaleSets"
    node_count      = var.agent_count
    vm_size         = var.vm_size
    vnet_subnet_id  = azurerm_subnet.cluster_resources.id
  }

  identity { type = "SystemAssigned" }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    service_cidr       = "10.2.0.0/16"
    dns_service_ip     = "10.2.0.10"
  }
}
