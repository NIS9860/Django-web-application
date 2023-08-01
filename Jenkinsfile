pipeline {
    agent any
    stages {
        stage("Cloning Code") {
            steps{
                echo "Cloning code from Github."
                git url:"https://github.com/NIS9860/Django-web-application.git", branch:"master"
            }
        }
        
        stage("Building Code") {
            steps{
                echo "Build code using docker."
                sh "docker build -t web-pathak-app ."
            }
        }
        
        stage("Pushing Code"){
            steps{
                echo "Pushing image to Dockerhub."
                withCredentials([usernamePassword(credentialsId:"dockerhub",usernameVariable:"dockerUser",passwordVariable:"dockerPass")]){
                sh "docker tag web-pathak--app ${env.dockerUser}/web-pathak-app:latest"
                sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                sh "docker push ${env.dockerUser}/web-pathak-app:latest"
                }
              
            }
        }
        
        stage("Deploying Code") {
            steps{
                echo "Deploying container with docker-compose."
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
