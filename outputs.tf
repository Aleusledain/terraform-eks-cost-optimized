# -------------------------------
# outputs.tf (Fixed version)
# -------------------------------

# ✅ EKS Cluster Name
output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.smart_cluster.name
}

# ✅ EKS Cluster Endpoint
output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = aws_eks_cluster.smart_cluster.endpoint
}

# ✅ Command to configure kubectl
output "kubeconfig_command" {
  description = "Command to update kubeconfig to connect kubectl to the cluster"
  value       = "aws eks update-kubeconfig --region us-east-1 --name ${aws_eks_cluster.smart_cluster.name}"
}

# ✅ Web App Service Hostname (optional; may be null until service is created)
output "service_hostname" {
  description = "Hostname of the Kubernetes web app service (if available)"
  value       = try(kubernetes_service.web_app.status[0].load_balancer[0].ingress[0].hostname, "N/A")
}
