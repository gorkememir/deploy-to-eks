provider "aws" {
  region = "us-east-1"
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster["demo-eks-cluster"].cluster_name
}

provider "kubernetes" {
  host                   = module.eks_cluster["demo-eks-cluster"].cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster["demo-eks-cluster"].cluster_ca_certificate)
  token                  = data.aws_eks_cluster_auth.cluster.token
}