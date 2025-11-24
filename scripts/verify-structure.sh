#!/bin/bash

echo "🔍 Vérification de la structure du projet"
echo "========================================="

files=(
    "index.html"
    "css/style.css"
    "Dockerfile"
    "Jenkinsfile"
    "README.md"
    "ansible/ansible.cfg"
    "ansible/playbook.yml"
    "ansible/inventory/hosts.ini"
    "ansible/roles/system_update/tasks/main.yml"
    "ansible/roles/docker/tasks/main.yml"
    "ansible/roles/terraform/tasks/main.yml"
    "ansible/roles/jenkins/tasks/main.yml"
    "terraform/main.tf"
    "terraform/variables.tf"
    "terraform/outputs.tf"
    "k8s/deployment.yaml"
    "k8s/service.yaml"
    "k8s/argocd-application.yaml"
    "monitoring/grafana-agent.yaml"
)

missing=0

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ $file - MANQUANT"
        missing=$((missing + 1))
    fi
done

echo ""
if [ $missing -eq 0 ]; then
    echo "🎉 Tous les fichiers sont présents!"
else
    echo "⚠️  $missing fichier(s) manquant(s)"
fi

echo ""
echo "📊 Statistiques:"
echo "   - Fichiers: $(find . -type f | wc -l)"
echo "   - Dossiers: $(find . -type d | wc -l)"
echo "   - Taille totale: $(du -sh . | cut -f1)"
