terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull de l'image depuis Docker Hub
resource "docker_image" "cv_image" {
  name         = "maryem102/cv-onepage:latest"
  keep_locally = false
}

# Création du conteneur
resource "docker_container" "moncv" {
  name  = "moncv"
  image = docker_image.cv_image.image_id

  ports {
    internal = 80
    external = 8585
  }

  restart = "unless-stopped"

  labels {
    label = "project"
    value = "cv-onepage"
  }

  labels {
    label = "environment"
    value = "production"
  }

  healthcheck {
    test         = ["CMD", "wget", "--quiet", "--tries=1", "--spider", "http://localhost/"]
    interval     = "30s"
    timeout      = "3s"
    start_period = "5s"
    retries      = 3
  }
}

# Outputs
output "container_id" {
  description = "ID du conteneur moncv"
  value       = docker_container.moncv.id
}

output "container_name" {
  description = "Nom du conteneur"
  value       = docker_container.moncv.name
}

output "access_url" {
  description = "URL d'accès au CV"
  value       = "http://localhost:8585"
}
