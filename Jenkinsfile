pipeline { 
  agent any
    stages {
            stage('Build') {
                steps {
                    bat "mvn -Dmaven.test.failure.ignore=true clean package"
                    archiveArtifacts 'target/*.jar'
                }

            }

            stage('JUnit Tests') {
                steps {
					bat "mvn test"
					junit '**/target/surefire-reports/TEST-*.xml'
                }
            }
      
          stage('Docker Build'){
                steps {
                    bat "docker build -t noor091/petclinic:1.0 ."
                }
           }

            stage("Push Docker Image"){
                steps {
                    withCredentials([string(credentialsId: 'docker-pass', variable: 'dockerPass')]) {
                        bat "docker login -u noor091 -p ${dockerPass}"
                    }
                    bat "docker push noor091/petclinic:1.0"
                }
            }
      
    }
}
