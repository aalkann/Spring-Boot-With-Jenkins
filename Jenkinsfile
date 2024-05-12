pipeline {
    
    tools{
        // Set Maven build tool
        maven 'Maven 3.9.6'
        // Set JDK
        jdk 'JDK 21'
    }
    
    agent any

    stages {        
        stage('Build') {
            steps {
                script{
                    // Get current directory
                    def currentDir = pwd()
                    // Define application directory
                    def appDir = "${currentDir}/app"
                    // Set workspace to the application directory
                    dir(appDir){
                        // Build and create the jar file 
                        sh 'mvn clean package'
                    }
                }
            }
        }
        
        stage('Docker Build'){
            steps{
                    // Build the image
                    docker.build('ahmettt/app:latest')
                }
            }
        }
        stage('Docker Push'){
            steps{
                script{
                    // Login to Docker Hub
                    withDockerRegistry(credentialsId: 'docker-credentail') {
                        // Push the image to the hub
                        docker.image("ahmettt/app:latest").push() 
                    }
                }
            }
        }
    }
    
}
