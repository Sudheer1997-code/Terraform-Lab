pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    options {
        timestamps()
        skipStagesAfterUnstable()
    }

    stages {

        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Sudheer1997-code/Terraform-Lab.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan.out -input=false'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan.out'
            }
        }
    }

    post {
        success {
            echo "✅ Terraform apply successful!"
        }
        failure {
            echo "❌ Terraform apply failed!"
        }
        cleanup {
            echo "🧹 Cleaning up workspace..."
            deleteDir()
        }
    }
}
