variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-ada-myk"
}

variable "resource_group_location" {
  description = "Azure region where the Resource Group will be created"
  type        = string
  default     = "Brazil South"
}

variable "aks_cluster_name" {
  description = "Name of the Azure Kubernetes Service (AKS) cluster"
  type        = string
  default     = "aks-ada-myk"
}

variable "dns_prefix" {
  description = "DNS prefix for the Kubernetes cluster"
  type        = string
  default     = "k8s"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to deploy"
  type        = string
  default     = "1.30.7"
}

variable "kubernetes_namespace" {
  description = "Namespace of the application"
  type        = string
  default     = "ada-myk-namespace"
}

variable "agent_count" {
  description = "Number of worker nodes in the Kubernetes cluster"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for Kubernetes worker nodes in the default node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
  default     = "vnet-ada-myk"
}

variable "virtual_network_address_space" {
  description = "Address space for the Azure Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Name of the Kubernetes subnet"
  type        = string
  default     = "subnet-ada-myk"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "network_security_group_name" {
  description = "Name of the Network Security Group (NSG)"
  type        = string
  default     = "nsg-ada-myk"
}

variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
  default     = "kv-ada-myk"
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain deleted Key Vault secrets before permanent deletion"
  type        = number
  default     = 7
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "59890415-2a07-415b-bf3f-a9d3a12caa38"
}

variable "sql_server_name" {
  description = "Name of the Azure SQL Server"
  type        = string
  default     = "sql-ada-myk"
}

variable "sql_database_name" {
  description = "Name of the Azure SQL Database"
  type        = string
  default     = "db-ada-myk"
}

variable "sql_admin_username" {
  description = "SQL Server admin username"
  type        = string
  default     = "sqladmin"
}

variable "sql_admin_password" {
  description = "SQL Server admin password"
  type        = string
  sensitive   = true
}