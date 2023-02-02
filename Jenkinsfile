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
          sh 'npm run build'
        }
      }
    }
  }
}
