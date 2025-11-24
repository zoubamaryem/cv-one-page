#!/bin/bash

echo "🧪 Test local du CV One Page"
echo "============================="

# Construire l'image Docker
echo "📦 Construction de l'image Docker..."
docker build -t cv-onepage:test .

# Lancer le conteneur
echo "🚀 Lancement du conteneur..."
docker run -d --name cv-test -p 8888:80 cv-onepage:test

# Attendre que le conteneur soit prêt
sleep 3

# Tester l'accès
echo "🔍 Test d'accès..."
if curl -f http://localhost:8888 > /dev/null 2>&1; then
    echo "✅ Le CV est accessible!"
    echo "🌐 Ouvrez http://localhost:8888 dans votre navigateur"
else
    echo "❌ Erreur: Le CV n'est pas accessible"
fi

echo ""
echo "Pour arrêter le test:"
echo "docker stop cv-test && docker rm cv-test"
