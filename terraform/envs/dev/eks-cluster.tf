module "eks_cluster" {
  for_each = local.clusters
  source = "../../modules/eks-cluster"

  eks_cluster_name = try(each.key, "simple-eks-cluster")
  app_label = try(each.value.app_label, "demo")
  vpc_cidr_block = try(each.value.vpc_cidr_block, "10.0.0.0/16")
  public_subnet_count = try(each.value.public_subnet_count, 2)
  private_subnet_count = try(each.value.private_subnet_count, 2)
  eks_cluster_role_name = try(each.value.eks_cluster_role_name, "eksClusterRole")
  eks_node_group_scaling_config = try(each.value.eks_node_group_scaling_config, {
    desired_size = 2
    max_size = 3
    min_size = 1
  })
  eks_node_group_name = try(each.value.eks_node_group_name, "simple-node-group")
  eks_node_role_name = try(each.value.eks_node_role_name, "eksNodeRole")
}