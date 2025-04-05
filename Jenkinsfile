pipeline {
    agent any    
    environment {
        DOCKER_IMAGE = 'gitesh8/gitesh-project-pipeline'
        DOCKERFILE = 'https://github.com/gitesh-git/giteshproject.git'
        CONTAINER_NAME = 'gitesh-project-pipeline'
        PORT_MAPPING = '8081:8080'
       // DOCKER_REGISTRY_CREDENTIALS = 'e5db24e8-34d5-4fef-8b98-bb8b8948c254'
       // DOCKER_REGISTRY_CREDENTIALS = '02fc35c3-51b7-4a1c-af9c-4bd5dac20bf7'
       // DOCKER_REGISTRY_CREDENTIALS = 'e5db24e8-34d5-4fef-8b98-bb8b8948c254'
        DOCKER_REGISTRY_CREDENTIALS = 'dckr_pat_Akm53G-P5cXVKrFv7cQ2Urysf1I'
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
                    docker.build DOCKER_IMAGE, '-f $DOCKERFILE .'
                }
            }
        }    
    stage('Push Docker Image') {
            steps {
                script {
                    //sudo docker login -u gitesh8
                    docker.withRegistry('docker.io', DOCKER_REGISTRY_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }
    stage('Deploy Docker Container') {
              steps {
                script {
                    // Pull the latest Docker image
                    docker.image(DOCKER_IMAGE).pull()

                    // Stop and remove the existing container if it exists
                    sh "sudo docker ps -a | grep ${CONTAINER_NAME} && docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME} || true"

                    // Run a new container with the specified image and port mapping
                    sh "sudo docker run -itd --name ${CONTAINER_NAME} -p ${PORT_MAPPING} ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
