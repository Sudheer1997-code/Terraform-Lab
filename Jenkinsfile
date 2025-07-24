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
                    sh 'terraform validate'
                }
                echo "Terraform validate completed."
            }
        }

        stage('Terraform Plan') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'terraform plan -out=tfplan.out -input=false'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    sh 'terraform apply -auto-approve tfplan.out'
                }
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
