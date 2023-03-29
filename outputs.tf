# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "vpc_id" {
    description = "vpc-id"
    value = module.vpc.vpc_id
}

output "public_subnets_blocks" {
    description = "public_subnets_cidr_blocks"
    value = module.vpc.public_subnets_cidr_blocks
}
/*
output "public_subnets_ids" {
    description = "public_subnets"
    value = module.vpc.public_subnets
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}
*/