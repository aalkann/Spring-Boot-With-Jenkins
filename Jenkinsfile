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
        
        stage('Docker Build and Push'){
            steps{
                script{
                    // Login to Docker Hub
                    withDockerRegistry(credentialsId: 'docker-credentail') {
                        // Build the image as ahmettt/app
                        docker.build('ahmettt/app')
                        // Push the image to the hub
                        docker.image("ahmettt/app").push() 
                    }
                }
            }
        }
    }
    
}
