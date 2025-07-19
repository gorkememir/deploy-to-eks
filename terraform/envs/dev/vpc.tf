module "eks_vpc" {
  source = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/22"
  public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24", "10.0.3.0/24"]
  azs = ["us-east-1a", "us-east-1b"]
}