variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Nome del progetto"
  type        = string
  default     = "eks-demo"
}

variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "dev"
}
