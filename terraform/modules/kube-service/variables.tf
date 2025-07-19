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

variable "container_name" {
  description = "Name of the container"
  type        = string
  default     = "web"
}

variable "container_image" {
  description = "Container image to deploy"
  type        = string
  default     = "nginx:latest"
}

variable "container_port" {
  description = "Port of the container"
  type        = number
  default     = 80
}

variable "replica_count" {  
  description = "Number of replicas to deploy"
  type        = number
  default     = 2
}

variable "service_name" {
  description = "Name of the Kubernetes service"
  type        = string
  default     = "demo-app-service"
} 

variable "service_port" {
  description = "Port of the service"
  type        = number
  default     = 80
}

variable "service_target_port" {
  description = "Target port of the service"
  type        = number
  default     = 80
}

variable "service_type" {
  description = "Type of the Kubernetes service"
  type        = string
  default     = "LoadBalancer"
}

variable "namespace" {
  description = "Namespace of the Kubernetes service"
  type        = string
  default     = "default"
}