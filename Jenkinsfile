pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/itheroesacademy/Dinesh-react.js-project.git']])
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh 'docker build -t my-react-app .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    echo 'Running Docker container...'
                    sh 'docker run -d -p 1012:1012 --name my-react-app-container my-react-app'
                }
            }
        }
        stage('Test Application') {
            steps {
                script {
                    echo 'Running tests...'
                    // You can add any test commands here, such as using curl to test endpoints
                    sh 'sleep 10' // Give the container some time to start
                    sh 'curl http://localhost:1012'
                }
            }
        }
    }

    post {
        always {
            script {
                echo 'Cleaning up...'
                //sh 'docker stop my-react-app-container || true'
                //sh 'docker rm my-react-app-container || true'
                //sh 'docker rmi my-react-app || true'
            }
        }
    }
}
