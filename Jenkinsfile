pipeline {
  agent {
    docker {
      image 'golang'
      args '-u root:root'
    }

  }
  stages {
    stage('Build Project') {
      steps {
        sh '''
		 	go mod init
			go build .
		 '''
      }
    }

    stage('Build Image') {
       docker.withRegistry('https://registry.hub.docker.com', 'credentials-id') {
        image = docker.build("aymanazzam07/violin:${env.BUILD_ID}")
       }
    }

    stage('Push Image') {
      docker.withRegistry('https://registry.hub.docker.com', 'credentials-id') {
        image.push()
     }
    }
  }
  post {
    failure {
      mail to: 'aymanazzam63@gmail.com', subject: "FAILURE: ${currentBuild.fullDisplayName}", body: 'The last build of GoViolin has been failed. please check the repo code.')
    }

  }
}
