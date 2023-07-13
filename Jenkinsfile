pipeline {
    agent any

    tools {
        maven "MAVEN_3.8.8"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nbaez001/api-product.git']])
            }
        }
        
        stage('Package') {
            steps {
                sh "mvn clean package -DskipTest=true"
            }
        }
        
        stage('Test') {
            steps {
                sh "mvn test"
            }
        }
        
        stage('Docker build') {
            steps {
                sh "docker build -t nbaez001/api-product:latest -f Dockerfile ."
            }
        }
        
        stage('Docker push') {
            steps {
                withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
                    sh "docker login -u nbaez001 -p ${dockerpwd} docker.io"
                }
                sh "docker push nbaez001/api-product:latest"
            }
        }
        
        stage('Docker run') {
            steps {
                sh "docker run --rm -p 8091:8091 --name=api-product nbaez001/api-product:latest"
            }
        }
    }
}
