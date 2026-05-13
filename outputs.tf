output "cluster_name" {
  description = "Nome del cluster EKS"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint del cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority" {
  description = "Certificato del cluster EKS"
  value       = module.eks.cluster_certificate_authority_data
}

