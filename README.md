# CV One Page - DevOps CI/CD Project

[![GitHub stars](https://img.shields.io/github/stars/zoubamaryem/cv-one-page?style=social)](https://github.com/zoubamaryem/cv-one-page/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/zoubamaryem/cv-one-page?style=social)](https://github.com/zoubamaryem/cv-one-page/network)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Docker Pulls](https://img.shields.io/docker/pulls/maryem102/cv-one-page)](https://hub.docker.com/repository/docker/maryem102/cv-one-page)

## 🚀 Description
Projet de déploiement d'un **CV One Page** utilisant les technologies DevOps modernes :  
**Docker, Kubernetes, Jenkins, Argo CD, Terraform, Prometheus et Grafana**.  

Objectifs :  
- Automatiser le **build, test et déploiement** via CI/CD  
- Déployer sur **Docker et Kubernetes**  
- Suivre l’état des services via **monitoring Prometheus/Grafana**  
- Implémenter une approche **GitOps avec Argo CD**

## 📦 Structure du projet
- **Docker** : containerisation de l’application CV  
- **Kubernetes** : orchestration multi-environnements  
- **Jenkins** : pipelines CI/CD  
- **Argo CD** : déploiement GitOps continu  
- **Terraform** : Infrastructure as Code (IaC) pour VM et clusters  
- **Prometheus & Grafana** : collecte et visualisation des métriques  

## 📊 Accès aux services
| Service | URL | Port |
|---------|-----|------|
| Jenkins | [http://192.168.56.10:8080](http://192.168.56.10:8080) | 8080 |
| CV (Docker) | [http://192.168.56.10:8585](http://192.168.56.10:8585) | 8585 |
| CV (K8s) | [http://192.168.56.10:30080](http://192.168.56.10:30080) | 30080 |
| Argo CD | [http://192.168.56.10:31000](http://192.168.56.10:31000) | 31000 |
| Prometheus | [http://192.168.56.10:9090](http://192.168.56.10:9090) | 9090 |
| Node Exporter | [http://192.168.56.10:9100](http://192.168.56.10:9100) | 9100 |
| Grafana | [http://192.168.56.10:30090](http://192.168.56.10:30090) | 30090 |

