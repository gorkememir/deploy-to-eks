resource "aws_eks_cluster" "eks_cluster" {
  name = var.eks_cluster_name

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.32"

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  # Ensure that IAM Role permissions are created before and deleted
  # after EKS Cluster handling. Otherwise, EKS will not be able to
  # properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster_role_policy_attachment,
  ]
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  node_group_name = var.eks_node_group_name
  node_role_arn = aws_iam_role.eks_node_role.arn
  subnet_ids = var.subnet_ids
  scaling_config {
    desired_size = var.scaling_config.desired_size
    max_size = var.scaling_config.max_size
    min_size = var.scaling_config.min_size
  }
}

resource "aws_iam_role" "eks_node_role" {
  name = var.eks_node_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "node_role_policy_attachment" {
  for_each = toset(var.node_policy_arns)
  policy_arn = each.value
  role       = aws_iam_role.eks_node_role.name
}


resource "aws_iam_role" "eks_cluster_role" {
  name = var.eks_cluster_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_role_policy_attachment" {
  for_each = toset(var.cluster_policy_arns)
  policy_arn = each.value
  role       = aws_iam_role.eks_cluster_role.name
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_ca_certificate" { 
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}
