# EKS Cluster
resource "aws_eks_cluster" "eks-cluster" {
  name                      = var.cluster_config.name
  role_arn                  = aws_iam_role.EKSClusterRole.arn
  enabled_cluster_log_types = ["api", "audit"]
  version                   = var.cluster_config.version

  vpc_config {
    subnet_ids              = flatten([var.public_subnets_id, var.private_subnets_id])
    security_group_ids      = flatten(var.security_groups_id)
    endpoint_private_access = "true"
    endpoint_public_access  = "true"
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceControllerPolicy
  ]
}



# NODE GROUP
resource "aws_eks_node_group" "node-ec2" {
  for_each        = { for node_group in var.node_groups : node_group.name => node_group }
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = each.value.name
  node_role_arn   = aws_iam_role.NodeGroupRole.arn
  subnet_ids      = flatten(var.private_subnets_id)

  scaling_config {
    desired_size = try(each.value.scaling_config.desired_size, 2)
    max_size     = try(each.value.scaling_config.max_size, 3)
    min_size     = try(each.value.scaling_config.min_size, 1)
  }

  update_config {
    max_unavailable = try(each.value.update_config.max_unavailable, 1)
  }

  ami_type       = each.value.ami_type
  instance_types = each.value.instance_types
  capacity_type  = each.value.capacity_type
  disk_size      = each.value.disk_size

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
  ]
}

/* resource "aws_eks_addon" "addons" {
  for_each          = { for addon in var.addons : addon.name => addon }
  cluster_name      = aws_eks_cluster.eks-cluster.name
  addon_name        = each.value.name
  resolve_conflicts = "OVERWRITE"
} */

data "tls_certificate" "cluster" {
  url = aws_eks_cluster.eks-cluster.identity.0.oidc.0.issuer
}

### OIDC config
resource "aws_iam_openid_connect_provider" "cluster" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = concat([data.tls_certificate.cluster.certificates.0.sha1_fingerprint])
  url             = aws_eks_cluster.eks-cluster.identity.0.oidc.0.issuer
}

/* resource "aws_cloudwatch_log_group" "log" {
  name = "/aws/eks/${var.cluster_config.name}/cluster"
  retention_in_days = 1
} */