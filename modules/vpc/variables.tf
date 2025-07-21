# variable "vpc_cidr" {}
# variable "public_subnet_cidr" {}
# variable "private_subnet_cidr" {}
# variable "az" {}

# variable "private_subnet_cidrs" {
#   type = list(string)
# }

# variable "azs" {
#   type = list(string)
# }

# modules/vpc/variables.tf

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}


# variable "azs" {
#   type    = list(string)
#   default = ["us-east-1a", "us-east-1b"]
# }

# variable "public_subnet_cidrs" {
#   type    = list(string)
#   default = ["10.0.1.0/24", "10.0.2.0/24"]
# }

# variable "private_subnet_cidrs" {
#   type    = list(string)
#   default = ["10.0.3.0/24", "10.0.4.0/24"]
# }


# # Existing variables
variable "vpc_cidr" {}
#  variable "public_subnet_cidr" {}
