#  Cluster basic info
output "cluster_name" {
  description = "EKS Cluster name"
  value       = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = aws_eks_cluster.eks.endpoint
}

#  Node group info (if you have one defined)
output "node_group_arn" {
  description = "ARN of the EKS node group"
  value       = aws_eks_node_group.node_group.arn
}

#  Command to update kubeconfig manually (optional)
output "kubeconfig_command" {
  description = "Run this locally to connect kubectl to the cluster"
  value       = "aws eks update-kubeconfig --region us-east-1 --name ${aws_eks_cluster.eks.name}"
}

#  Kubernetes LoadBalancer service public URL (optional, once deployed)
output "service_hostname" {
  description = "Public hostname of the web app load balancer"
  value       = kubernetes_service.web_app.status[0].load_balancer[0].ingress[0].hostname
}
