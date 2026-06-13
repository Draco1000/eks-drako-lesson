variable "aws_region" {
  description = "The AWS region to deploy our cluster into"
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "The env name (dev, staging, prod) used for tagging & cost-tracking"
  type        = string
  default     = "dev"
}

variable "worker_instance_type" {
  description = "The EC2 instance type for our EKS worker nodes"
  type        = string
  default     = "t3.medium" # Just for cost efficiency
}

variable "min_node_count" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 1
}
