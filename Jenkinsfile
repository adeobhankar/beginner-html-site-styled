pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    def app = docker.build("<your-dockerhub-username>/website")
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        app.push('latest')
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }
    }
    triggers {
        githubPush()
    }
}
