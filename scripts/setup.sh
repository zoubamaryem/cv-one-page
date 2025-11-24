#!/bin/bash

echo "🚀 Setup initial du projet CV One Page"
echo "========================================"

# Vérifier si on est dans le bon répertoire
if [ ! -f "index.html" ]; then
    echo "❌ Erreur: Exécutez ce script depuis la racine du projet"
    exit 1
fi

# Demander les informations utilisateur
read -p "Entrez votre IP VM: " VM_IP
read -p "Entrez votre username SSH: " SSH_USER
read -p "Entrez votre username Docker Hub: " DOCKER_USER
read -p "Entrez votre username GitHub: " GITHUB_USER

echo ""
echo "🔧 Mise à jour des fichiers de configuration..."

# Mise à jour de l'inventory Ansible
sed -i "s/YOUR_VM_IP/$VM_IP/g" ansible/inventory/hosts.ini
sed -i "s/YOUR_USER/$SSH_USER/g" ansible/inventory/hosts.ini

# Mise à jour du Jenkinsfile
sed -i "s/votre-username/$DOCKER_USER/g" Jenkinsfile

# Mise à jour de Terraform
sed -i "s/votre-username/$DOCKER_USER/g" terraform/main.tf

# Mise à jour K8s
sed -i "s/votre-username/$DOCKER_USER/g" k8s/deployment.yaml
sed -i "s/votre-username/$GITHUB_USER/g" k8s/argocd-application.yaml

echo "✅ Configuration terminée!"
