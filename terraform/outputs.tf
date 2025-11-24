output "container_status" {
  description = "Statut du conteneur"
  value       = "Container '${docker_container.moncv.name}' is running on port ${docker_container.moncv.ports[0].external}"
}
