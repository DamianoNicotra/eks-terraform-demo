# EKS Terraform Demo

[![Terraform CI](https://github.com/DamianoNicotra/eks-terraform-demo/actions/workflows/terraform.yml/badge.svg)](https://github.com/DamianoNicotra/eks-terraform-demo/actions/workflows/terraform.yml)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Deploy an Amazon EKS cluster (Kubernetes) on AWS using Terraform.

## ✅ Pipeline Status

The CI/CD pipeline runs on every push:
- `terraform fmt -check` (non-blocking)
- `terraform init`
- `terraform validate`
- `terraform plan`

## Architecture Decisions

| Decision | Reason |
|----------|--------|
| **EKS vs self-managed K8s** | EKS removes control plane management overhead. AWS handles HA and security patches. |
| **Terraform vs eksctl** | Terraform is cloud-agnostic, reusable, and integrates with existing IaC pipelines. |
| **Managed node groups** | Simpler than self-managed EC2. AWS handles scaling and AMI updates. |
| **t3.small nodes** | Cost-effective for development. Balance between price and performance. |

## Known Limitations

- No cluster autoscaling configured
- No add-ons (CoreDNS, kube-proxy, VPC CNI) version pinning
- Terraform state stored locally → not safe for team use
- No private endpoint access (public endpoint only)

## How to Improve

- Add cluster autoscaler for dynamic node scaling
- Move Terraform state to S3 backend with DynamoDB lock
- Configure private endpoint + VPN for production security
- Add AWS Load Balancer Controller for Ingress
- Deploy monitoring stack (Prometheus + Grafana) via Helm

## Cost Control

**This infrastructure is designed to be destroyable.**

After testing, run:
```bash
terraform destroy -auto-approve
