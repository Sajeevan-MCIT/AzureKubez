output "id" {
  value = [
    for name in local.cluster_names : name
  ]
}
