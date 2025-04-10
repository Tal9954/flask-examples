pipeline {
    agent any
	options {
       	 ansiColor('xterm')
	}
    stages {
        stage('Build') {
            steps {
                // Build the Docker image
                sh 'docker build -t shlomke .'
                // Tag the Docker image
                sh 'docker tag shlomke localhost:8082/shlomke-test'
                // Push the Docker image to the registry
                sh 'docker push localhost:8082/shlomke-test'
	        sh 'echo -e "\033[31mRed\033[0m"'
		sh 'printf "\033[31mRed\033[0m\n"'
            }
        }
        stage('Test') {
            steps {
                snykSecurity(
                    snykInstallation: 'snyk',
                    snykTokenId: '4a771172-fc3c-4d70-bab9-9a896db78568', 
                    additionalArguments: '--docker shlomke'
		    
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
