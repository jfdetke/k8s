output "name" {
  value = "${kubernetes_pod.myapp.metadata.0.name}"
}

