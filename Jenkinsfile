pipeline {
    agent any
    
    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh '''
                docker build -t adeobhankar/website:latest .
                '''
            }
        }
        
        stage('Push') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                        docker push adeobhankar/website:latest
                        '''
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying to Kubernetes...'
                sh '''
                kubectl apply -f kubernetes/deployment.yaml
                '''
            }
        }
        
        stage('Verify') {
            steps {
                echo 'Verifying the deployment...'
                sh '''
                kubectl rollout status deployment/my-app
                '''
            }
        }
    }
}
