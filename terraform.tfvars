# vpc_cidr             = "10.0.0.0/16"
# public_subnet_cidr   = "10.0.1.0/24"
# private_subnet_cidr  = "10.0.2.0/24"
# azs = ["us-east-1a", "us-east-1b"]

vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

azs = ["us-east-1a", "us-east-1b"]


# az                   = "ap-south-1a"

ami           = "ami-020cba7c55df1f615"
instance_type = "t2.micro"
key_name      = "ubutran"

db_instance_class = "db.t3.micro"
db_name           = "mydb"
db_username       = "admin"
db_password       = "admin1234"
