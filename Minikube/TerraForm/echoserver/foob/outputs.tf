output "name" {
  value = "${kubernetes_pod.myapp1.metadata.0.name}"
}

