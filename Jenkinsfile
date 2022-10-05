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
        withSonarQubeEnv(credentialsId: "sonarqube-credentials", installationName: "sonarqube-server"){
          sh 'npm run sonar'
        }
        timeout(time: 10, unit: "MINUTES") {
          def qg = waitForQualityGate()
          if (qg.status != 'OK') {
             error "Pipeline aborted due to quality gate failure: ${qg.status}"
          }
        }
      }
    }

    stage('Quality Gate') {
      steps {
        timeout(time: 10, unit: "MINUTES") {
          def qg = waitForQualityGate()
          if (qg.status != 'OK') {
             error "Pipeline aborted due to quality gate failure: ${qg.status}"
          }
        }
      }
    }

  }

}
