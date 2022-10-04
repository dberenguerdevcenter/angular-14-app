pipeline{

  agent {
    node {
      label 'node-nodejs'
    }
  }

  stages {
    stage('SonarQube analysis') {
      steps {
        script { // You can override the credential to be used
          sh 'npm run sonar'
        }
      }
    }
  }

}
