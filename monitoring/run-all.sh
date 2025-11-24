#!/bin/bash

echo "🚀 Lancement complet du monitoring"
echo "================================="

# 1️⃣ Configuration Grafana Cloud
echo ""
echo "🔧 Étape 1: Configuration Grafana Cloud"
./configure.sh

# 2️⃣ Installer les exporters
echo ""
echo "📦 Étape 2: Installation des exporters (Node + Docker)"
sudo ./install-exporters.sh

# 3️⃣ Installer Grafana Agent
echo ""
echo "📦 Étape 3: Installation de Grafana Agent"
sudo ./install-grafana-agent.sh

# 4️⃣ Tester tous les endpoints
echo ""
echo "🧪 Étape 4: Test des métriques"
./test-metrics.sh

echo ""
echo "🎉 Monitoring prêt !"
echo "📊 Pour suivre Grafana Agent en direct : sudo journalctl -u grafana-agent -f"
echo "🌐 Pour accéder aux métriques locales :"
echo "   - Node Exporter : http://localhost:9100/metrics"
echo "   - Docker Metrics : http://localhost:9323/metrics"
