pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1' // Change as per your 
        TF_VAR_key_name = 'ubutran' // Replace with your actual key name (without `.pem`)
         AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
         AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    tools {
        terraform 'Terraform-1.6.6' // Set up this Terraform version in Jenkins Tools
    }

     stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Sudheer1997-code/Terraform-Lab.git', branch: 'main'
            }
        }
    stage('Verify AWS Identity') {
  steps {
    sh 'aws sts get-caller-identity'
  }
}


        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        // stage('Terraform Format Check') {
        //     steps {
        //         sh 'terraform fmt -check'
        //     }
        // }

        stage('Terraform Format Check') {
  steps {
    script {
      def fmtStatus = sh(script: 'terraform fmt -check', returnStatus: true)
      if (fmtStatus != 0) {
        echo 'Terraform files are not properly formatted'
        // Do not fail the build here
      }
    }
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
