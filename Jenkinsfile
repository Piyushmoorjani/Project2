# Use the official Nginx image as a base
FROM nginx:latest

# Copy HTML files to the Nginx server directory
COPY ./html /usr/share/nginx/html

# Expose port 8000
EXPOSE 8000

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]






pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Pull the code from the repository
                git branch: 'main', url: 'https://github.com/Piyushmoorjani/Project2.git'
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

    post {
        always {
            // Cleanup: Stop and remove the container if it exists
            script {
                sh 'docker rm -f Container1 || true'
                sh 'docker rmi image1 || true'
            }
        }
    }
}

