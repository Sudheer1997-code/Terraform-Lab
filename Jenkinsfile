pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1' // Change as per your 
        TF_VAR_key_name = 'ubutran' // Replace with your actual key name (without `.pem`)
    }

    tools {
        terraform 'Terraform-1.6.6' // Set up this Terraform version in Jenkins Tools
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Sudheer1997-code/2-tier-architecture1' // Update with your Git repo
            }
        } 

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Format Check') {
            steps {
                sh 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve to Apply?'
                sh 'terraform apply tfplan'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/*.tf', fingerprint: true
        }
        failure {
            echo 'Terraform pipeline failed.'
        }
    }
}
