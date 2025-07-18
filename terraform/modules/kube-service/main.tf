resource "kubernetes_deployment" "demo_app" {
  metadata {
    name = var.deployment_name
    labels = {
      app = var.app_label
    }
  }

  spec {
    replicas = var.replica_count

    selector {
      match_labels = {
        app = var.app_label
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_label
        }
      }

      spec {
        container {
          name  = var.container_name
          image = var.container_image

          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "demo_app_svc" {
  metadata {
    name = var.service_name
  }

  spec {
    selector = {
      app = var.app_label
    }

    port {
      port        = var.service_port
      target_port = var.service_target_port
    }

    type = var.service_type
  }
}
