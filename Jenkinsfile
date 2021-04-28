pipeline {
    agent any
    stages {
        stage("Compile") {
            steps{
                bat "mvn -version"
                bat "mvn clean compile"
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
                bat 'docker build -t noor091/petclinic:1.0 .'
            }
        }
        stage("Push Docker Image"){
            steps{
                withCredentials([string(credentialsId: 'docker-pass', variable: 'dockerPass')]) {
                    bat "docker login -u noor091 -p ${dockerPass}"
                }
                bat 'docker push noor091/petclinic:1.0'
            }
        }



    }
}
