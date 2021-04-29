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
                            steps{
                            bat "mvn test"
                          junit '**/target/surefire-reports/TEST-*.xml'

                          }
               }
      
    }
}
