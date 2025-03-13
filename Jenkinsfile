pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Angycht/java-api-rest.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t java-api-rest .'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push java-api-rest'
            }
        }
    }
}
