pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh '''
                sudo docker build -t adeobhankar/website:latest .
                '''
            }
        }
        
        stage('Push') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                sh '''
                docker login -u "adeobhankar" -p "Discover1@"
                docker push myusername/website:latest
                '''
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
