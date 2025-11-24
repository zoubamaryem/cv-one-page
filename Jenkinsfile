pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'maryem102/cv-onepage'
        DOCKER_TAG = "${BUILD_NUMBER}"
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
        SLACK_WEBHOOK = credentials('slack-webhook-url')
    }
    
    triggers {
        pollSCM('H/5 * * * *')
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Récupération du code depuis GitHub...'
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Construction de l'image Docker ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }
        
        stage('Test Image') {
            steps {
                script {
                    echo 'Test de l\'image Docker...'
                    sh """
                        docker run -d --name test-cv -p 9999:80 ${DOCKER_IMAGE}:${DOCKER_TAG}
                        sleep 5
                        curl -f http://localhost:9999 || exit 1
                        docker stop test-cv
                        docker rm test-cv
                    """
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    echo 'Connexion à Docker Hub et push de l\'image...'
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS_ID) {
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                echo 'Nettoyage des images locales...'
                sh """
                    docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG} || true
                    docker system prune -f
                """
            }
        }
    }
    
    post {
        success {
            script {
                def message = """
                    ✅ *Pipeline Jenkins - Succès*
                    
                    *Projet:* ${env.JOB_NAME}
                    *Build:* #${env.BUILD_NUMBER}
                    *Image:* ${DOCKER_IMAGE}:${DOCKER_TAG}
                    *Durée:* ${currentBuild.durationString}
                    
                    Image disponible sur Docker Hub!
                """
                
                sh """
                    curl -X POST ${SLACK_WEBHOOK} \
                    -H 'Content-Type: application/json' \
                    -d '{"text": "${message}"}'
                """
            }
            echo 'Pipeline exécuté avec succès!'
        }
        
        failure {
            script {
                def message = """
                    ❌ *Pipeline Jenkins - Échec*
                    
                    *Projet:* ${env.JOB_NAME}
                    *Build:* #${env.BUILD_NUMBER}
                    *Durée:* ${currentBuild.durationString}
                    
                    Vérifiez les logs pour plus de détails.
                """
                
                sh """
                    curl -X POST ${SLACK_WEBHOOK} \
                    -H 'Content-Type: application/json' \
                    -d '{"text": "${message}"}'
                """
            }
            echo 'Pipeline échoué!'
        }
        
        always {
            echo 'Nettoyage final...'
            cleanWs()
        }
    }
}
