variable "deployment_name" {
  description = "Name of the Kubernetes deployment"
  type        = string
  default     = "demo-app"
}

variable "app_label" {
  description = "Label for the app"
  type        = string
  default     = "demo"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
  default     = 2
}

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

variable "eks_node_group_scaling_config" {
  description = "Scaling configuration for the EKS node group"
  type        = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
  default     = {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}
