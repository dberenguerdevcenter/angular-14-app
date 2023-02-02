pipeline{

  agent {
    node {
      label 'nodejs-node'
    }
  }

  stages {

    stage('NPM build') {
      steps {
        script {
          sh 'npm install'
          sh 'npm run build &'
          sleep 60
        }
      }
    }

    stage('SonarQube analysis') {
      steps {
        withSonarQubeEnv(credentialsId: "sonarqube-credentials", installationName: "sonarqube-server"){
          sh 'npm run sonar'
        }
      }
    }

    stage('Quality Gate') {
      steps {
        timeout(time: 10, unit: "MINUTES") {
          script {
            def qg = waitForQualityGate()
            if (qg.status != 'OK') {
               error "Pipeline aborted due to quality gate failure: ${qg.status}"
            }
          }
        }
      }
    }

  }
}
