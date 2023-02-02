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

  }
}
