provider "kubernetes" {
  config_context_cluster   = "minikube"
}

resource "kubernetes_pod" "echoserver1" {
  metadata {
    name = "echoserver1"
  }
  spec {
    container {
      image = "k8s.gcr.io/echoserver:1.4"
      name  = "echoserver-name"
    }
  }
}
