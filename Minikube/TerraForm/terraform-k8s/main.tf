provider "kubernetes" {
  config_context_cluster = "minikube"
}

resource "kubernetes_namespace" "one-minikube-namespace" {
  metadata {
    name = "my-first-terraform-namespace"
  }
}

//provider "helm" {
//  kubernetes { 
//    config_context_cluster = "minikube"
//  }
//}
//
//resource "helm_release" "local" {
//  name  = "buildachart"
//  chart = "./buildachart"
//}
