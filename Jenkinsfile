pipeline {
    agent {label "dev"};
    stages {
        stage("code clone from github") {
            steps {
                git url: "https://github.com/priyanshijat/Node-todo-application.git" 
            }
        }
        stage("build an image") {
            steps {
                sh "docker build -t node-image ."
            }
        }
        stage("get notification on email"){
            steps{
                emailext body: 'build sucessful',
                    subject: 'congratulations for successful build',
                    to: 'priyanshijat06@gmail.com'
            }
        }
        stage("push to dockerhub") {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "dockerhubcreds",
                    usernameVariable: "dockerHubUser",
                    passwordVariable: "dockerHubPass"
                )]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker tag node-image ${env.dockerHubUser}/node-image:latest"
                    sh "docker push ${env.dockerHubUser}/node-image:latest"
                }
            }
}
        stage("test"){
            steps{
                echo "test developer krega"
            }
        }
        stage("deploy"){
            steps{
                sh "docker compose up -d"
            }
        }
    }
}
