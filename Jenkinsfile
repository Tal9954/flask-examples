pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
		docker build shlomke
		docker tag shlomke "localhost:5000/shlomke-test"
		docker push localhost:5000/shlomke-test
                
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
