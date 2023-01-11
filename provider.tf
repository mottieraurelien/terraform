terraform {

  # Terraform CLI version :
  required_version = ">= 1.3.7"

  # Terraform will drive our infrastructure to create many small servers ("instances")
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

variable "cluster_api_url" {
  type    = string
  default = "https://192.168.10.28:8006/api2/json"
}

variable "cluster_api_token_id" {
  type    = string
  default = "tin@pam!tin_token_id"
}

variable "cluster_api_token_secret" {
  type      = string
  sensitive = true
}

# We won't use cloud providers AWS, Google Cloud nor Azure.
# We will us our own provider called Proxmox.
provider "proxmox" {
  pm_api_url          = var.cluster_api_url
  pm_api_token_id     = var.cluster_api_token_id
  pm_api_token_secret = var.cluster_api_token_secret
  pm_tls_insecure     = true
}