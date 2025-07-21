# 2-Tier AWS Infrastructure with Terraform & Jenkins

## Modules
- VPC with Subnets, IGW, Route Table, and Security Groups
- EC2 Instance in Public Subnet
- RDS MySQL in Private Subnet

## CI/CD Automation
- Jenkins Pipeline automates the provisioning process using Terraform.

## Setup Instructions
1. Clone the repo
2. Configure AWS credentials on Jenkins or use IAM role
3. Trigger Jenkins Pipeline
4. View EC2 and RDS in AWS Console
