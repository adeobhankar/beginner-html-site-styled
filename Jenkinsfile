pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    // Build Docker image from Dockerfile
                    sh 'docker build -t my-website-image .'
                }
            }
        }
        stage('Stop and Remove Existing Container') {
            steps {
                script {
                    echo 'Stopping and removing existing container...'
                    // Stop and remove any existing container named 'my-website-container'
                    sh 'docker stop my-website-container || true'
                    sh 'docker rm my-website-container || true'
                }
            }
        }
        stage('Deploy New Container') {
            steps {
                script {
                    echo 'Deploying new container...'
                    // Run a new container from the built image
                    sh 'docker run -d --name my-website-container -p 99:80 my-website-image'
                }
            }
        }
        stage('Validate Deployment') {
            steps {
                script {
                    echo 'Validating deployment...'
                    
                    // Validate if the container is running
                    sh 'docker ps | grep my-website-container'

                    // Validate if the website is accessible
                    sh 'curl -I http://localhost:99 | grep "200 OK"'
                }
            }
        }
    }
}
