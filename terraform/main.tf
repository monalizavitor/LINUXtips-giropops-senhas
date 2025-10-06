terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = var.cluster_name
  region  = var.region
  version = var.kubernetes_version

  node_pool {
    name       = "${var.cluster_name}-worker-pool"
    size       = var.node_size
    node_count = var.node_count
    auto_scale = var.auto_scale
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
  }

  tags = var.tags
}

output "cluster_id" {
  value       = digitalocean_kubernetes_cluster.cluster.id
  description = "The ID of the Kubernetes cluster"
}

output "cluster_endpoint" {
  value       = digitalocean_kubernetes_cluster.cluster.endpoint
  description = "The endpoint for the Kubernetes cluster"
}

output "kubeconfig" {
  value       = digitalocean_kubernetes_cluster.cluster.kube_config[0].raw_config
  description = "Kubeconfig file for the cluster"
  sensitive   = true
}