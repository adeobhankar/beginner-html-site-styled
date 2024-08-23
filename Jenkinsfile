pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
        KUBERNETES_CREDENTIALS_ID = 'kubernetes-credentials-id'
        KUBECONFIG = '/path/to/jenkins/kubeconfig' // Ensure the path is correct
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
                    withKubeConfig([credentialsId: KUBERNETES_CREDENTIALS_ID]) {
                        sh 'kubectl apply -f deployment.yaml'
                    }
                }
            }
        }
    }
}
