locals {
    clusters = {
        demo-eks-cluster = {
            eks_cluster_role_name = "eksClusterRole"
            eks_node_group_name = "demo-node-group"
            eks_node_role_name = "eksNodeRole"
            scaling_config = {
                desired_size = 2
                max_size = 3
                min_size = 1
            }
            cluster_policy_arns = [
                "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
            ]
            node_policy_arns = [
                "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
                "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
                "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
            ]
        }
    }
    services = {
        demo-app-1 = {
            deployment_name = "demo-app"
            namespace = "default"
            app_label = "demo"
            container_name = "web"
            container_image = "nginx:latest"
            container_port = 80
            replica_count = 2
            service_name = "demo-app-service"
            service_port = 80
            service_target_port = 80
            service_type = "LoadBalancer"
        }
    }
}