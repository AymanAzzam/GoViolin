pipeline {
  agent {
    docker {
      image 'golang'
      args '-u root:root'
    }

  }
  stages {
    stage('Move Files') {
      steps {
        sh 'cp -r . .'
      }
    }

    stage('Build Project') {
      steps {
        sh '''
		 	go mod init
			go build .
		 '''
      }
    }

    stage('Build Image') {
      steps {
        sh 'docker build -t aymanazzam07/violin:1.0 .'
      }
    }

    stage('Push Image') {
      steps {
        sh 'docker push aymanazzam07/violin:1.0'
      }
    }

  }
  post {
    failure {
      mail(to: 'aymanazzam63@gmail.com', subject: "FAILURE: ${currentBuild.fullDisplayName}", body: 'The last build of GoViolin has been failed. please check the repo code.')
    }

  }
}
