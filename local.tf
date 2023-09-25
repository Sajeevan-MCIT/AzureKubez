locals {
  cluster_names = ["Saj","Paul","Ladi","Emmanuel","Douglas","Jade","Ola"]
}

resource "azurerm_resource_group" "classwork2509" {
  name     = "rg-${var.convention}"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "myk8s" {
  for_each            = { for cluster in local.cluster_names : cluster => cluster }
  name                = "k8s-${var.convention}-${each.key}"
  location            = azurerm_resource_group.classwork2509.location
  resource_group_name = azurerm_resource_group.classwork2509.name
  dns_prefix          = "${var.prefix}-k8s"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}