pipeline{

  agent {
    node {
      label 'node-nodejs'
    }
  }

  stages {
//
//     stage('Clone Git repository') {
//       steps {
//         git(url: 'https://github.com/dberenguerdevcenter/angular-14-app.git', branch: 'sonarqube-implementation', changelog: true, credentialsId: 'git-credentials', poll: true)
//       }
//     }

    stage('SonarQube analysis') {
      steps {
        withSonarQubeEnv(credentialsId: 'sonarqube-credentials', installationName: 'My SonarQube Server') { // You can override the credential to be used
          sh 'npm run sonar'
        }
      }
    }
  }

}
