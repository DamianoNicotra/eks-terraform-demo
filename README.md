# EKS Terraform Demo - Kubernetes on AWS

Kubernetes cluster on AWS EKS with Terraform. Nginx deployed and reachable. Prometheus monitoring attempted but failed due to Free Tier limits.

## What worked

- EKS cluster created with Terraform (VPC, subnets, node groups)
- kubectl configured and nodes verified
- Nginx deployed on Kubernetes with LoadBalancer
- Application tested (curl returned Welcome to nginx page)
- Everything destroyed after testing to keep costs near zero

## What I wanted to do but failed

- Install Prometheus + Grafana for cluster monitoring
- The t3.micro nodes (Free Tier) didn't have enough resources
- The pods stayed in Pending state. The stack never fully started.

## What I learned

- Kubernetes is powerful but resource-hungry
- Free Tier has limits. Monitoring requires planning.
- A partial failure is still a lesson. Next time I will use larger nodes (and destroy them immediately).

## Technologies

- AWS: EKS, VPC, EC2, LoadBalancer
- Kubernetes (kubectl)
- Nginx
- Infrastructure as Code: Terraform

## Trade-offs

- EKS control plane costs ~$0.10/hour → destroyed immediately
- t3.micro vs larger instances → free but underpowered for monitoring
- Perfect plan vs reality → always test small first

## Commands

```bash
# Deploy cluster
cd terraform
terraform init
terraform apply -auto-approve

## Configure kubectl
aws eks update-kubeconfig --region eu-west-1 --name eks-demo-cluster

## Deploy Nginx
kubectl create deployment nginx --image=nginx
kubectl expose deployment nginx --port=80 --type=LoadBalancer

## Test
curl http://<EXTERNAL-IP>

## Cleanup
terraform destroy -auto-approve

## Project structure
eks-terraform-demo/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── README.md
