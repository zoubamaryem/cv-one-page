variable "docker_image" {
  description = "Nom de l'image Docker"
  type        = string
  default     = "votre-username/cv-onepage:latest"
}

variable "container_name" {
  description = "Nom du conteneur"
  type        = string
  default     = "moncv"
}

variable "external_port" {
  description = "Port externe du conteneur"
  type        = number
  default     = 8585
}
