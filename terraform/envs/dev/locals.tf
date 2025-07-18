locals {
    clusters = {
        demo-eks-cluster = {
            eks_cluster_role_name = "eksClusterRole"
            eks_node_group_name = "demo-node-group"
            eks_node_role_name = "eksNodeRole"
            eks_node_group_scaling_config = {
                desired_size = 2
                max_size = 3
                min_size = 1
            }
        }
    }
    # services = {
    #     demo-app-1 = {
    #         deployment_name = "demo-app"
    #         app_label = "demo"
    #         container_name = "web"
    #         container_image = "nginx:latest"
    #         container_port = 80
    #         replica_count = 2
    #         service_name = "demo-app-service"
    #         service_port = 80
    #         service_target_port = 80
    #         service_type = "LoadBalancer"
    #         vpc_cidr_block = "10.0.0.0/16"
    #         public_subnet_count = 2
    #         private_subnet_count = 2
    #         eks_node_group_scaling_config = {
    #             desired_size = 2
    #             max_size = 3
    #             min_size = 1
    #         }
    #         eks_node_group_name = "simple-node-group"
    #         eks_node_role_name = "eksNodeRole"
    #     }
    # }
}