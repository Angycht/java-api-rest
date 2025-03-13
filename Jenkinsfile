pipeline {
    agent any
    environment {
        IMAGE_NAME = "java-api-rest"
    }
    
    stages {
        stage('Clonar repositorio') {
            steps {
                git url: 'https://github.com/Angycht/java-api-rest.git', branch: 'main'
            }
        }
        
        stage('Compilar proyecto') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Construir imagen Docker') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
                }
            }
        }
        
        stage('Publicar imagen') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds') {
                        docker.image("${IMAGE_NAME}:${BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
