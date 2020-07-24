# First, minikube must be running:
# minikube start 
# minikube dashboard
#  Then we can terraform
## terraform  destroy
## terraform init && terraform apply
## kubectl get services # to see that none are running, then create one:
## kubectl expose deployment terraform-example --type=LoadBalancer --port=8080
## kubectl get services
## minikube service terraform-example
#
# https://minikube.sigs.k8s.io/docs/handbook/accessing/
# minikube 'tunnel' will create an external IP, and port that can be accessed
