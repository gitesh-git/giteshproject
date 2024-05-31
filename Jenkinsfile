pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'gitesh8/giteshproject'
        DOCKERFILE = 'https://github.com/gitesh-git/giteshproject.git/Dockerfile'
        CONTAINER_NAME = 'giteshproject'
        PORT_MAPPING = '8080:8080'
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
    stage('Build Docker Image') {
            steps {
                script {
                    'docker build -t gitesh8/giteshproject -f https://github.com/gitesh-git/giteshproject.git/Dockerfile'
                }
            }
        }

    stage('Push Docker Image') {
            steps {
                script {
                   sh "docker login -u gitesh8 -p redhat@123"
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
    stage('Deploy Docker Container') {
            steps {
                script {
                    // Pull the latest Docker image
                    docker.image(DOCKER_IMAGE).pull()

                    // Stop and remove the existing container if it exists
                   // sh "docker ps -a | grep ${CONTAINER_NAME} && docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME} || true"

                    // Run a new container with the specified image and port mapping
                    sh "docker run -itd --name ${CONTAINER_NAME} -p ${PORT_MAPPING} ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
