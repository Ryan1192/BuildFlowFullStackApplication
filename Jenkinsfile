pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t lbg7-20220905/lbg-api:latest -t imcalled/lbg-api:$BUILD_NUMBER . 
                docker push lbg7-20220905/lbg-api:latest
                docker push lbg7-20220905/lbg-api:$BUILD_NUMBER
                '''
           }
        }
        stage('Deploy') {
            steps {
                sh '''
                ssh -i '~/.ssh/id_rsa' jenkins@35.242.152.138 << EOF
                docker stop lbg-container
                docker rm lbg-container
                docker run -d -p 8080:8080 --name lbg-container lbg7-20220905/lbg-api:latest
                '''
            }
        }
    }
}