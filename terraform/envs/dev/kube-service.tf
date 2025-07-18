# module "kube_service" {
#   depends_on = [module.eks_cluster]
#   for_each = local.services
#   source = "../../modules/kube-service"

#   deployment_name = try(each.value.deployment_name, "demo-app")
#   app_label = try(each.value.app_label, "demo")
#   container_name = try(each.value.container_name, "web")
#   container_image = try(each.value.container_image, "nginx:latest")
#   container_port = try(each.value.container_port, 80)
# }