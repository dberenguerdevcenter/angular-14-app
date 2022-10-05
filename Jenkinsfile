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
        withSonarQubeEnv(credentialsId: "sonarqube-token-2", "sonarqube-server"){
          sh 'npm run sonar'
        }
        timeout(time: 10, unit: "MINUTES") {
          waitForQualityGate abortPipeline: true
        }
      }
    }

  }

}
