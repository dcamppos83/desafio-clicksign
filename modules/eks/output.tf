output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}

output "oidc" {
  value = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
}

output "role_arn" {
  value = aws_iam_openid_connect_provider.cluster.arn
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}

output "cluster_name" {
  value = aws_eks_cluster.eks-cluster.name
}