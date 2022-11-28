## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.eks-cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.node-ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_openid_connect_provider.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.EKSClusterRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.NodeGroupRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSVPCResourceControllerPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.eks_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cluster_outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodes_cluster_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodes_internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [tls_certificate.cluster](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addons"></a> [addons](#input\_addons) | n/a | <pre>list(object({<br>    name    = string<br>    version = string<br>  }))</pre> | <pre>[<br>  {<br>    "name": "kube-proxy",<br>    "version": "v1.22.6-eksbuild.1"<br>  },<br>  {<br>    "name": "vpc-cni",<br>    "version": "v1.11.0-eksbuild.1"<br>  }<br>]</pre> | no |
| <a name="input_cluster_config"></a> [cluster\_config](#input\_cluster\_config) | n/a | <pre>object({<br>    name    = string<br>    version = string<br>  })</pre> | <pre>{<br>  "name": "eks-cluster",<br>  "version": "1.22"<br>}</pre> | no |
| <a name="input_node_groups"></a> [node\_groups](#input\_node\_groups) | n/a | <pre>list(object({<br>    name           = string<br>    instance_types = list(string)<br>    ami_type       = string<br>    capacity_type  = string<br>    disk_size      = number<br>    scaling_config = object({<br>      desired_size = number<br>      min_size     = number<br>      max_size     = number<br>    })<br>    update_config = object({<br>      max_unavailable = number<br>    })<br>  }))</pre> | <pre>[<br>  {<br>    "ami_type": "AL2_x86_64",<br>    "capacity_type": "ON_DEMAND",<br>    "disk_size": 20,<br>    "instance_types": [<br>      "t3.micro"<br>    ],<br>    "name": "t3-micro-standard",<br>    "scaling_config": {<br>      "desired_size": 2,<br>      "max_size": 2,<br>      "min_size": 1<br>    },<br>    "update_config": {<br>      "max_unavailable": 1<br>    }<br>  },<br>  {<br>    "ami_type": "AL2_x86_64",<br>    "capacity_type": "SPOT",<br>    "disk_size": 20,<br>    "instance_types": [<br>      "t3.micro"<br>    ],<br>    "name": "t3-micro-spot",<br>    "scaling_config": {<br>      "desired_size": 2,<br>      "max_size": 2,<br>      "min_size": 1<br>    },<br>    "update_config": {<br>      "max_unavailable": 1<br>    }<br>  }<br>]</pre> | no |
| <a name="input_private_subnets_id"></a> [private\_subnets\_id](#input\_private\_subnets\_id) | n/a | `list` | n/a | yes |
| <a name="input_public_subnets_id"></a> [public\_subnets\_id](#input\_public\_subnets\_id) | n/a | `list` | n/a | yes |
| <a name="input_security_groups_id"></a> [security\_groups\_id](#input\_security\_groups\_id) | n/a | `list` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_kubeconfig-certificate-authority-data"></a> [kubeconfig-certificate-authority-data](#output\_kubeconfig-certificate-authority-data) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | n/a |
