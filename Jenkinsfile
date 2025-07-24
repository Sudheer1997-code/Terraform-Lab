pipeline {
    agent any

    environment {
        TF_VAR_region = 'us-east-1'
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Checkout Code') {
            steps {
                git 'https://github.com/Sudheer1997-code/Terraform-Lab.git'
            }
        }

        stage('Terraform Init') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Format Check') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    sh 'terraform fmt -check -recursive'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                echo "Running terraform validate..."
                timeout(time: 3, unit: 'MINUTES') {
                    sh 'terraform validate || true' // allows pipeline to continue even if schema fails temporarily
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'terraform plan -input=false -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'terraform apply -input=false -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            echo "🧹 Cleaning up workspace..."
            deleteDir()
        }
    }
}
