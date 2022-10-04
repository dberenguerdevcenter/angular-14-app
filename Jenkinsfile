pipeline{

  agent {
    node {
      label 'node-nodejs'
    }
  }

  stages {
    stage('SonarQube analysis') {
      steps {
        withSonarQubeEnv(credentialsId: 'sonarqube-credentials', installationName: 'My SonarQube Server') { // You can override the credential to be used
          sh 'npm run sonar'
        }
      }
    }
  }

}
