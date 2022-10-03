pipeline{

  agent {
    node {
      label 'node-nodejs'
    }
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

}
