variable "public_subnets_id" {
  type = list
  description = ""
}

variable "private_subnets_id" {
  type = list
  description = ""
}

variable "security_groups_id" {
  type = list
  description = ""
}

variable "vpc_id" {
  type = string
  description = ""
}

variable "cluster_config" {
  type = object({
    name    = string
    version = string
  })
  default = {
    name    = "eks-cluster"
    version = "1.22"
  }
}

variable "node_groups" {
  type = list(object({
    name           = string
    instance_types = list(string)
    ami_type       = string
    capacity_type  = string
    disk_size      = number
    scaling_config = object({
      desired_size = number
      min_size     = number
      max_size     = number
    })
    update_config = object({
      max_unavailable = number
    })
  }))
  default = [
    {
      name           = "t3-micro-standard"
      instance_types = ["t3.micro"]
      ami_type       = "AL2_x86_64"
      capacity_type  = "ON_DEMAND"
      disk_size      = 20
      scaling_config = {
        desired_size = 2
        max_size     = 2
        min_size     = 1
      }
      update_config = {
        max_unavailable = 1
      }
    },
    {
      name           = "t3-micro-spot"
      instance_types = ["t3.micro"]
      ami_type       = "AL2_x86_64"
      capacity_type  = "SPOT"
      disk_size      = 20
      scaling_config = {
        desired_size = 2
        max_size     = 2
        min_size     = 1
      }
      update_config = {
        max_unavailable = 1
      }
    },
  ]
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))

  default = [
    {
      name    = "kube-proxy"
      version = "v1.22.6-eksbuild.1"
    },
    {
      name    = "vpc-cni"
      version = "v1.11.0-eksbuild.1"
    },
    /* {
      name    = "coredns"
      version = "v1.8.7-eksbuild.1"
    }, */
    /* {
      name    = "aws-ebs-csi-driver"
      version = "v1.6.0-eksbuild.1"
    } */
  ]
}