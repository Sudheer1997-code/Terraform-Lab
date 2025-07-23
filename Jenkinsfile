

pipeline {
    agent any  // or use: agent { label 'your-agent-label' }

    tools {
        terraform 'Terraform-1.6.6'  // Make sure this version is installed in Jenkins -> Manage Jenkins -> Global Tool Configuration
    }

    environment {
        TF_VAR_region = 'us-east-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Sudheer1997-code/Terraform-Lab.git', branch: 'main'
            }
        }
    
  stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }



//  stage('Terraform Init') {
//       steps {
//         sh 'terraform init'
//       }
//     }

    // stage('Terraform Plan') {
    //   steps {
    //     sh 'terraform plan -out=tfplan'
    //   }
    // }

    // stage('Terraform Apply') {
    //   steps {
    //     sh 'terraform apply -auto-approve tfplan'
    //   }
    // }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan & Apply') {
      steps {
        sh 'terraform plan'
        sh 'terraform apply -auto-approve'
      }
    }

    

    post {
        failure {
            echo 'Pipeline failed.'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
    }
}
}