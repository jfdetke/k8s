provider "kubernetes" {
  config_context_cluster   = "minikube"
}

resource "kubernetes_pod" "mypod1" {
  metadata {
    name = "mypod"
  }
  spec {
    container {
      image = "httpd"
      name  = "webcon"
    }
  }
}
