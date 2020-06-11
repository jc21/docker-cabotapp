pipeline {
	options {
		buildDiscarder(logRotator(numToKeepStr: '10'))
		disableConcurrentBuilds()
		ansiColor('xterm')
	}
	agent any
	environment {
		IMAGE_NAME      = "cabotapp"
		TEMP_IMAGE_NAME = "${IMAGE_NAME}_${BUILD_NUMBER}"
		TAG_NAME        = "latest"
	}
	stages {
		stage('Build') {
			steps {
				sh 'docker build --pull --no-cache --squash --compress -t "${TEMP_IMAGE_NAME}" .'
			}
		}
		stage('Publish') {
			steps {
				sh 'docker tag "${TEMP_IMAGE_NAME}" "jc21/${IMAGE_NAME}:${TAG_NAME}"'
				sh 'docker push "jc21/${IMAGE_NAME}:${TAG_NAME}"'
			}
		}
	}
	post {
		success {
			juxtapose event: 'success'
			sh 'figlet "SUCCESS"'
		}
		failure {
			juxtapose event: 'failure'
			sh 'figlet "FAILURE"'
		}
		always {
			sh 'docker rmi "${TEMP_IMAGE_NAME}"'
		}
	}
}
