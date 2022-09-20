pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t imcalled/lbg-api:latest -t imcalled/lbg-api:$ .
                docker push imcalled/lbg-api:latest
                docker push imcalled/lbg-api:$build_number
                '''
           }
        }
        stage('Deploy') {
            steps {
                sh '''
                ssh -i '~/ssh/authorized_keys' jenkins@35.242.145.153 << EOF
                docker stop lbg-container
                docker rm lbg-container
                docker run -d -p 8080:8080 --name lbg-container imcalled/lbg-api:latest
                '''
            }
        }
    }
}