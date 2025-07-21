# variable "private_subnet_id" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "db_sg_id" {}
variable "instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
