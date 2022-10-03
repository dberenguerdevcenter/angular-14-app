pipeline{

  agent {
    node {
      label 'node-nodejs'
    }
  }

  environment {
    registryCredential='docker-hub-credentials'
    registryFrontend = 'franaznarteralco/frontend-demo'
  }

  stages {
    node {
      stage('SonarQube analysis') {
        withSonarQubeEnv(credentialsId: 'sonarqube-credentials', installationName: 'My SonarQube Server') { // You can override the credential to be used
          sh 'npm run sonar'
        }
      }
    }
  }

  post {
    always {
      sh 'docker logout'
    }
  }
}
