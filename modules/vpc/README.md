## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.natgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.private_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.rta_private_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rta_public_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.custom_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_config"></a> [cluster\_config](#input\_cluster\_config) | n/a | <pre>object({<br>    name    = string<br>    version = string<br>  })</pre> | <pre>{<br>  "name": "eks-cluster",<br>  "version": "1.22"<br>}</pre> | no |
| <a name="input_networking"></a> [networking](#input\_networking) | n/a | <pre>object({<br>    cidr_block      = string<br>    region          = string<br>    vpc_name        = string<br>    azs             = list(string)<br>    public_subnets  = list(string)<br>    private_subnets = list(string)<br>    nat_gateways    = bool<br>  })</pre> | <pre>{<br>  "azs": [<br>    "us-east-1a",<br>    "us-east-1b"<br>  ],<br>  "cidr_block": "10.0.0.0/16",<br>  "nat_gateways": true,<br>  "private_subnets": [<br>    "10.0.3.0/24",<br>    "10.0.4.0/24"<br>  ],<br>  "public_subnets": [<br>    "10.0.1.0/24",<br>    "10.0.2.0/24"<br>  ],<br>  "region": "us-east-1",<br>  "vpc_name": "custom-vpc"<br>}</pre> | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | n/a | <pre>list(object({<br>    name        = string<br>    description = string<br>    ingress = list(object({<br>      description      = string<br>      protocol         = string<br>      from_port        = number<br>      to_port          = number<br>      cidr_blocks      = list(string)<br>      ipv6_cidr_blocks = list(string)<br>    }))<br>    egress = list(object({<br>      description      = string<br>      protocol         = string<br>      from_port        = number<br>      to_port          = number<br>      cidr_blocks      = list(string)<br>      ipv6_cidr_blocks = list(string)<br>    }))<br>  }))</pre> | <pre>[<br>  {<br>    "description": "Inbound & Outbound traffic for custom-security-group",<br>    "egress": [<br>      {<br>        "cidr_blocks": [<br>          "0.0.0.0/0"<br>        ],<br>        "description": "Allow all outbound traffic",<br>        "from_port": 0,<br>        "ipv6_cidr_blocks": [<br>          "::/0"<br>        ],<br>        "protocol": "-1",<br>        "to_port": 0<br>      }<br>    ],<br>    "ingress": [<br>      {<br>        "cidr_blocks": [<br>          "0.0.0.0/0"<br>        ],<br>        "description": "Allow HTTPS",<br>        "from_port": 443,<br>        "ipv6_cidr_blocks": null,<br>        "protocol": "tcp",<br>        "to_port": 443<br>      },<br>      {<br>        "cidr_blocks": [<br>          "0.0.0.0/0"<br>        ],<br>        "description": "Allow HTTP",<br>        "from_port": 80,<br>        "ipv6_cidr_blocks": null,<br>        "protocol": "tcp",<br>        "to_port": 80<br>      }<br>    ],<br>    "name": "custom-security-group"<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnets_id"></a> [private\_subnets\_id](#output\_private\_subnets\_id) | n/a |
| <a name="output_public_subnets_id"></a> [public\_subnets\_id](#output\_public\_subnets\_id) | n/a |
| <a name="output_security_groups_id"></a> [security\_groups\_id](#output\_security\_groups\_id) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
