pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/nesrinechaouani/Terraform-cicd.git'
            }
        }
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }      
        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        stage('Deploy') {
            steps {
                // Ajoutez ici les étapes pour déployer votre application 
                // sur l'infrastructure créée par Terraform 
                // (ex: copier les fichiers, redémarrer le service, etc.)
                sh 'echo "Application deployed!"'
            }
        }
    }
    post {
        always {
            // Nettoyer les fichiers temporaires, etc.
            sh 'echo "Pipeline finished!"'
        }
        success {
            // Envoyer une notification de succès
            echo "Deployment successful!"
        }
        failure {
            // Envoyer une notification d'échec
            echo "Deployment failed!"
        }
    }
}
