pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Build the Docker image
                sh 'docker build -t shlomke .'  // Note: added the dot to indicate the context of the Dockerfile
                // Tag the Docker image
                sh 'docker tag shlomke localhost:5000/shlomke-test'
                // Push the Docker image to the registry
                sh 'docker push localhost:5000/shlomke-test'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
