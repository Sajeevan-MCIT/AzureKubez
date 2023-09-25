output "id" {
  value = [
    for cluster in azurerm_kubernetes_cluster.myk8s: cluster.id
  ]
}