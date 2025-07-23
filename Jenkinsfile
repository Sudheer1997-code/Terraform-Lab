// pipeline {
//     agent any

//     environment {
//         AWS_REGION = 'us-east-1' // Change as per your 
//         TF_VAR_key_name = 'ubutran' // Replace with your actual key name (without `.pem`)
//         //   AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
//         //  AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
//     }

//     tools {
//         terraform 'Terraform-1.6.6'
//  // Set up this Terraform version in Jenkins Tools
//     }

//      stages {
//         stage('Checkout Code') {
//             steps {
//                 git url: 'https://github.com/Sudheer1997-code/Terraform-Lab.git', branch: 'main'
//             }
//         }
//     stage('Terraform Version') {
//             steps {
//                 sh 'terraform version'
//             }
//         }

//         stage('Terraform Init') {
//             steps {
//                 sh 'terraform init'
//             }
//         }

//         // stage('Terraform Format Check') {
//         //     steps {
//         //         sh 'terraform fmt -check'
//         //     }
//         // }

//         stage('Terraform Format Check') {
//   steps {
//     script {
//       def fmtStatus = sh(script: 'terraform fmt -check', returnStatus: true)
//       if (fmtStatus != 0) {
//         echo 'Terraform files are not properly formatted'
//         // Do not fail the build here
//       }
//     }
//   }
// }


//         stage('Terraform Validate') {
//             steps {
//                 sh 'terraform validate'
//             }
//         }

//         stage('Terraform Plan') {
//             steps {
//                 sh 'terraform plan -out=tfplan'
//             }
//         }

//         stage('Terraform Apply') {
//             steps {
//                 input message: 'Approve to Apply?'
//                 sh 'terraform apply tfplan'
//             }
//         }
//     }

//     post {
//         always {
//             node {
//                 archiveArtifacts artifacts: '**/*.tf', fingerprint: true
//                 echo 'Terraform pipeline failed.'
//             }
//         //     archiveArtifacts artifacts: '**/*.tf', fingerprint: true
//         // }
//         // failure {
//         //     echo 'Terraform pipeline failed.'
//          }
//     }
// }

pipeline {
    agent any  // or use: agent { label 'your-agent-label' }

    tools {
        terraform 'Terraform-1.6.6'  // Make sure this version is installed in Jenkins -> Manage Jenkins -> Global Tool Configuration
    }

    environment {
        TF_VAR_region = 'us-east-1'
    }

    stages {
        // stage('Checkout Code') {
        //    git branch: 'main', url: 'https://github.com/Sudheer1997-code/Terraform-Lab.git'

        // }

        

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        // stage('Terraform Apply') {
        //     steps {
        //         input "Apply Terraform changes?"
        //         sh 'terraform apply tfplan'
        //     }
        // }

        stage('Terraform Apply') {
    steps {
        sh 'terraform apply -auto-approve'
    }
}
  stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

         stage('Terraform Plan') {
            steps {
                sh 'terraform plan -input=false'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -input=false'
            }
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
