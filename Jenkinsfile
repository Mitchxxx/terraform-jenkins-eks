pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        region = "eu-west-1"
    }
    stages {
        stage ('Checkout SCR'){
            steps{
                script {
                    checkout scmGit(branches: [[name: '*/main']], userRemoteConfigs:[[url: 'https://github.com/Mitchxxx/terraform-jenkins-eks.git']])
                }
            }
        }
        stage ('Initializing Teerraform'){
            steps{
                script {
                    dir('Eks-server'){
                        sh 'terraform init'
                    }
                }
            }
        }
        stage ('Terraform validate'){
            steps{
                script {
                    dir('Eks-server'){
                        sh 'terraform validate'
                    }
                }
            }
        }
    }
}