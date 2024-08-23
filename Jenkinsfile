pipeline {
    agent slave2

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh 'docker build -t my-website-image .'
                }
            }
        }
        stage('Stop and Remove Existing Container') {
            steps {
                script {
                    sh '''
                    if [ "$(docker ps -q -f name=my-website-container)" ]; then
                        docker stop my-website-container
                        docker rm my-website-container
                    fi
                    '''
                }
            }
        }
        stage('Deploy New Container') {
            steps {
                script {
                    sh 'docker run -d -p 99:80 --name my-website-container my-website-image'
                }
            }
        }
        stage('Validate Deployment') {
            steps {
                script {
                    sh 'curl -I localhost:99'
                }
            }
        }
    }
}
