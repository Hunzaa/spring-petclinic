pipeline {
    agent any
    stages {
        
                    stage('Build') {
                steps {
                    bat "mvn -Dmaven.test.failure.ignore=true clean package"
                    archiveArtifacts 'target/*.jar'
                }

            }
       
        stage("Build Artifact"){
            steps{
                bat "mvn clean package"
            }
            post{
                success {
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
        stage("Build Docker Image"){
            steps{
                bat 'docker build -t noor091/petclinic:2.4.2 .'
            }
        }
        stage("Push Docker Image"){
            steps{
                withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                    bat "docker login -u noor091 -p ${dockerHubPwd}"
                }
                bat 'docker push noor091/petclinic:2.4.2'
            }
        }

        

    }
    
}
