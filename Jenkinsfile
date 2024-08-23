pipeline {
    agent {'slave2'}

    stages {
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
                    echo 'Stopping and removing existing container...'
                    sh '''
                    if [ "$(docker ps -q -f name=my-website-container)" ]; then
                        docker stop my-website-container
                    fi
                    if [ "$(docker ps -a -q -f name=my-website-container)" ]; then
                        docker rm my-website-container
                    fi
                    '''
                }
            }
        }
        stage('Deploy New Container') {
            steps {
                script {
                    echo 'Deploying new container...'
                    sh 'docker run -d --name my-website-container -p 100:80 my-website-image'
                }
            }
        }
        stage('Validate Deployment') {
            steps {
                script {
                    echo 'Validating deployment...'
                    sh 'curl -I http://localhost:99'
                }
            }
        }
    }
}
