pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'docker-credentials-id'
        KUBECONFIG = 'kubeconfig' // Ensure the path is correct
    }

    stages {
        stage('Build') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        sh 'docker build -t adeobhankar/website:latest .'
                        sh 'docker push adeobhankar/website:latest'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Ensure kubectl is in PATH and KUBECONFIG is set
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}
