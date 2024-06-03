pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'gitesh8/giteshproject'
        DOCKERFILE = 'https://github.com/gitesh-git/giteshproject.git/Dockerfile'
        CONTAINER_NAME = 'giteshproject'
        PORT_MAPPING = '8080:8080'
        DOCKER_REGISTRY_CREDENTIALS = 'e5db24e8-34d5-4fef-8b98-bb8b8948c254'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
    stage('Build') {
            steps {
                // Use Maven to build your project
                sh 'mvn install'
            }
        }    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build DOCKER_IMAGE, '-f $DOCKERFILE .'
                }
            }
        }
    stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/', DOCKER_REGISTRY_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }
      stage('Deploy Docker Container') {
              steps {
                script {
                    // Pull the latest Docker image
                    sh "sudo docker pull gitesh8/giteshproject:latest"

                    // Stop and remove the existing container if it exists
                   // sh "docker ps -a | grep ${CONTAINER_NAME} && docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME} || true"

                    // Run a new container with the specified image and port mapping
                    sh "docker run -itd --name giteshproject -p 8080:8080 gitesh8/giteshproject:latest"
                }
            }
        }
    }
}
