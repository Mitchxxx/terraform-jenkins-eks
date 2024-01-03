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
        stage ('Initializing Terraform'){
            steps{
                script {
                    dir('Eks-server'){
                        sh 'terraform init'
                    }
                }
            }
        }
        stage ('Formatting terraform code'){
            steps{
                script {
                    dir('Eks-server'){
                        sh 'terraform fmt'
                    }
                }
            }
        }
        stage ('Validating terraform'){
            steps{
                script {
                    dir('Eks-server'){
                        sh 'terraform validate'
                    }
                }
            }
        }
        stage ('Previewing the Infra using Terraform'){
            steps{
                script {
                    dir('Eks-server'){
                        sh 'terraform plan'
                    }
                    input(message: "Are you sue to proceed?", ok: "Proceed")
                }
            }
        }
        stage ('Creating/Destroying an EKS Cluster'){
            steps{
                script {
                    dir('Eks-server'){
                        sh 'terraform $action --auto-approve'
                    }
                }
            }
        }
    }
}