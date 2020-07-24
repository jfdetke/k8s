provider "kubernetes" {
  config_context_cluster   = "minikube"
}

# In kubernetes, you can deploy with different type of objects
# like, Pod, ReplicationController, Deployment etc.
# While Deployment is highly recommended for production use-cases, 
# we'll simply use Pod object
resource "kubernetes_pod" "myapp" {
  metadata {
    name = "myapp"
    labels = {
      App = "myapp"
    }
  }

  spec {
    container {
      image = "myapp:0.1"
      name  = "myapp"

      port {
        container_port = 8080
      }
    }
  }
}

# Let's create a Service object - in simple words, this object helps
# you with loadbalancing and network abstraction on top of pods
resource "kubernetes_service" "myapp" {
  metadata {
    name = "myapp"
  }
  spec {
    selector = {
        App = kubernetes_pod.myapp.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "NodePort" #"LoadBalancer"
  }
}
