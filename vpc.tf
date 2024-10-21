module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.14.0"
  name = "ahl-vpc"
  # or we can use 10.0.0.0/16
  cidr = "192.168.0.0/16"

  # adding 2 az for high availability
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["192.168.1.0/24", "192.168.2.0/24"]
  private_subnets = ["192.168.3.0/24", "192.168.4.0/24"]
  enable_nat_gateway = true
  map_public_ip_on_launch = true
}
