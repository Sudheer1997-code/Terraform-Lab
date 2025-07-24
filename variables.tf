variable "vpc_cidr" {
  type = string
}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
# root/variables.tf

# variable "azs" {
#   type = list(string)
# }


variable "ami" {}
variable "instance_type" {}
variable "key_name" {}

variable "db_instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
