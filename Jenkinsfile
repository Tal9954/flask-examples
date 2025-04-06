pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Build the Docker image
                sh 'docker build -t shlomke .'  
                // Tag the Docker image
                sh 'docker tag shlomke localhost:5000/shlomke-test'
                // Push the Docker image to the registry
                sh 'docker push localhost:5000/shlomke-test'
            }
        }
        stage('Test') {
            steps {
                 snykSecurity(
          snykInstallation: '<snyk:latest>',
          snykTokenId: '<c879a1c6-ae8c-4cb5-9a17-14db60c116bd>',
          // --docker shlomke
        )
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
