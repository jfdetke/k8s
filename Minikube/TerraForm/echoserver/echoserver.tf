provider "kubernetes" {
  config_context_cluster   = "minikube"
}

//resource "kubernetes_service" "terraform-example" {
//  metadata {
//    name = "terraform-example"
//  }
//  spec { 
//
//    selector = { 
//    App = "myExampleApp"
//    }
//
//    port  {
//      port        = 8080    // other pods can reach this port
//      node_port   = 30201   // exposed externally to the cluster
//      target_port = 8080    // port service on container listens to
//    }
//
//    type = "NodePort"
//  }
//}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
    labels = {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "k8s.gcr.io/echoserver:1.4"
          name  = "example"
         
          port {
            container_port = 8080
          }

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          //liveness_probe {
          //  http_get {
          //    path = "/nginx_status"
          //    port = 80
          //
          //    http_header {
          //      name  = "X-Custom-Header"
          //      value = "Awesome"
          //    }
          //  }
          //
          //  initial_delay_seconds = 3
          //  period_seconds        = 3
          //}
        }
      }
    }
  }
}

