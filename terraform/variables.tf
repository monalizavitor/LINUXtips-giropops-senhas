variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "giropops-senhas-cluster"
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "nyc1"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.33.1-do.4"
}

variable "node_size" {
  description = "Size of the worker nodes"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "node_count" {
  description = "Initial number of worker nodes"
  type        = number
  default     = 3
}

variable "auto_scale" {
  description = "Enable autoscaling"
  type        = bool
  default     = true
}

variable "min_nodes" {
  description = "Minimum number of nodes when autoscaling"
  type        = number
  default     = 2
}

variable "max_nodes" {
  description = "Maximum number of nodes when autoscaling"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Tags to apply to the cluster"
  type        = list(string)
  default     = ["giropops-senhas", "production"]
}
