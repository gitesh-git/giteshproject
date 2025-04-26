pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'gitesh8/giteshproject'
        DOCKER_TAG = 'latest'
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
        stage('Pull Code') {
            steps {
                git 'https://github.com/gitesh-git/giteshproject.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://hub.docker.com/']) {
                    script {
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker rm -f giteshproject || true
                docker run -d --name giteshproject -p 8081:8080 ${DOCKER_IMAGE}:${DOCKER_TAG}
                '''
            }
        }
    }
}
