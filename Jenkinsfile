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
                    snykInstallation: 'snyk',  // Use the correct Snyk installation name here
                    snykTokenId: 'snyk-token',  // Use the correct secret ID for your Snyk token
                    // Specify the Docker image to scan
                    dockerImage: 'shlomke'  // This scans the 'shlomke' image built in the previous step
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

