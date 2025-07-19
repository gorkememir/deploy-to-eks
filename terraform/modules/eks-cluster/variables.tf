variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "simple-eks-cluster"
}

variable "eks_cluster_role_name" {
  description = "Name of the EKS cluster role"
  type        = string
  default     = "eksClusterRole"
}

variable "eks_node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "simple-node-group"
}

variable "eks_node_role_name" {
  description = "Name of the EKS node role"
  type        = string
  default     = "eksNodeRole"
}

variable "subnet_ids" {
  description = "List of subnet ids"
  type        = list(string)
}

variable "cluster_policy_arns" {
  description = "List of ARNs of the policies to attach to the EKS cluster role"
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
}

variable "node_policy_arns" {
  description = "List of ARNs of the policies to attach to the EKS node role"
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
}

variable "scaling_config" {
  description = "Scaling configuration for the EKS node group"
  type        = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
}