FROM nginx:latest


COPY ./html /usr/share/nginx/html


EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]






pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Pull the code from the repository
                git branch: 'master', url: 'https://github.com/Piyushmoorjani/Project2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = 'image1' // Name of the Docker image
                    def dockerfilePath = './Dockerfile' // Path to the Dockerfile
                    
                    // Build the Docker image
                    sh "docker build -t ${imageName} -f ${dockerfilePath} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    def containerName = 'Container1' // Name of the Docker container
                    // Run the Docker container
                    sh "docker run -d -p 8000:80 --name ${containerName} ${imageName}"
                }
            }
        }
   }
