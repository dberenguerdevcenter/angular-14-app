pipeline{

  agent {
    node {
      label 'node-nodejs'
    }
  }

  stages {

    stage('NPM build') {
      steps {
        script {
          sh 'npm install'
          sh 'npm run build'
        }
      }
    }

    stage('SonarQube analysis') {
      steps {
        script {
          sh 'npm run sonar'
        }
      }
    }
  }

}
