# Utilisation de l'image Nginx officielle
FROM nginx:alpine

# Métadonnées
LABEL maintainer="votre-email@example.com"
LABEL description="CV One Page - DevOps Engineer"
LABEL version="1.0"

# Copie des fichiers du CV dans le répertoire Nginx
COPY index.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/

# Exposition du port 80
EXPOSE 80

# Vérification de santé
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Commande de démarrage (par défaut dans l'image Nginx)
CMD ["nginx", "-g", "daemon off;"]
