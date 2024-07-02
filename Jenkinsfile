pipeline {
    agent any

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
