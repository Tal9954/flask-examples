pipeline {
    agent any
    options {
        ansiColor('xterm')
    }

    parameters {
        string(name: 'ENV', defaultValue: 'dev', description: 'Environment name')
        string(name: 'VERSION', defaultValue: '1.0.0', description: 'Version to deploy')
    }

    environment {
        CONSUL_HOST = 'http://consul:8500/'
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
                // Print Red color using escape codes
                sh 'echo -e "\033[31mRed\033[0m"'
                sh 'printf "\033[31mRed\033[0m\n"'
            }
        }

        stage('Test') {
            steps {
                snykSecurity(
                    snykInstallation: 'snyk',
                    snykTokenId: '0bf442e5-73fb-40dc-a5cd-e5c3e0f30c2a',
                    additionalArguments: '--docker shlomke'
                )
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }

        stage('Print Params') {
            steps {
                echo "ENV: ${params.ENV}"
                echo "VERSION: ${params.VERSION}"
            }
        }

        stage('Push to Consul') {
            steps {
                script {
                    // Push ENV param to Consul
                    sh """
                        curl --request PUT \
                          --data '${params.ENV}' \
                          ${CONSUL_HOST}/v1/kv/project/config/env
                    """

                    // Push VERSION param to Consul (use a different key)
                    sh """
                        curl --request PUT \
                          --data '${params.VERSION}' \
                          ${CONSUL_HOST}/v1/kv/project/config/version
                    """
                }
            }
        }
    }
}

