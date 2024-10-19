pipeline {
    agent any

    environment {
        // Define imageName in the environment
        imageName = image1
    }

    stages {
        stage('Pull Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Piyushmoorjani/Project2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${imageName} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d -p 8000:80 ${imageName}"
                }
            }
        }
    }
}
