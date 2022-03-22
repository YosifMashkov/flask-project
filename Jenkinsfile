pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t "564731541479.dkr.ecr.eu-central-1.amazonaws.com/flaskapp:$GIT_COMMIT" .'
                }
        }
        stage('Push') {
            steps {
                sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 564731541479.dkr.ecr.eu-central-1.amazonaws.com/flaskapp'
                sh 'docker push 564731541479.dkr.ecr.eu-central-1.amazonaws.com/flaskapp:$GIT_COMMIT'
            }
        }
        stage('Deploy') {
            steps {
                sh 'helm upgrade flaskapp helm/flaskapp/ --install --set deployment.tag=$GIT_COMMIT'
            }
        }
    }
  }