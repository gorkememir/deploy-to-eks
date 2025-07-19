module "eks_cluster" {
  for_each = local.clusters
  source = "../../modules/eks-cluster"
  subnet_ids = module.eks_vpc.private_subnet_ids
  eks_cluster_name = each.key
  eks_cluster_role_name = try(each.value.eks_cluster_role_name, "eksClusterRole")
  eks_node_group_name = try(each.value.eks_node_group_name, "simple-node-group")
  eks_node_role_name = try(each.value.eks_node_role_name, "eksNodeRole")
  cluster_policy_arns = try(each.value.cluster_policy_arns, ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"])
  node_policy_arns = try(each.value.node_policy_arns, ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"])
  scaling_config = try(each.value.scaling_config, {
    desired_size = 2
    max_size = 3
    min_size = 1
  }) 
}

module "eks_vpc" {
  source = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/22"
  public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24", "10.0.3.0/24"]
  azs = ["us-east-1a", "us-east-1b"]
}