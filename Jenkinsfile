pipeline {
    agent any

    environment {
	DOCKER_HUB_CREDENTIALS = credentials('dockercreds')
	GIT_REPO_URL = 'https://github.com/rajarvinth/Capstone.git'
	GIT_CREDENTIALS_ID = 'gitcreds'
      }
    stages {
	stage('Build') {
	    steps {
	       script {
		    sh 'chmod +x build.sh'
		    sh './build.sh'
		}
	     }
	  }
    
	stage('Deploy') {
	    steps {
	       script {
		   // Clean up previous deployments
		   sh 'docker-compose down'
		   
 		   // Ensure deploy.sh is executable and run it with branch name argument
		    sh 'chmod +x deploy.sh'
		    sh "./deploy.sh ${env.BRANCH_NAME}"
		}
	     }
	}
    }
}
