pipeline {
  agent { label 'docker' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  triggers {
    cron('@daily')
  }
  stages {
    stage('Build') {
      steps {
        sh "docker build -t computerminds/phpcs-drupal:${env.BUILD_NUMBER} ."
      }
    }
    stage('Publish') {
      when {
        branch 'master'
      }
      steps {
        withDockerRegistry([ credentialsId: "1679f2a2-5b25-4749-8f17-163fd0ec35af", url: "" ]) {
          // Add back in the numbered tag.
          sh "docker push computerminds/phpcs-drupal:${env.BUILD_NUMBER}"
        }
      }
    }
  }
}
