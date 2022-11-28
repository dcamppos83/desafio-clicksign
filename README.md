## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>0.15.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3.54.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | n/a | <pre>list(object({<br>    name        = string<br>    description = string<br>    ingress = list(object({<br>      description      = string<br>      protocol         = string<br>      from_port        = number<br>      to_port          = number<br>      cidr_blocks      = list(string)<br>      ipv6_cidr_blocks = list(string)<br>    }))<br>    egress = list(object({<br>      description      = string<br>      protocol         = string<br>      from_port        = number<br>      to_port          = number<br>      cidr_blocks      = list(string)<br>      ipv6_cidr_blocks = list(string)<br>    }))<br>  }))</pre> | <pre>[<br>  {<br>    "description": "Inbound & Outbound traffic for custom-security-group",<br>    "egress": [<br>      {<br>        "cidr_blocks": [<br>          "0.0.0.0/0"<br>        ],<br>        "description": "Allow all outbound traffic",<br>        "from_port": 0,<br>        "ipv6_cidr_blocks": [<br>          "::/0"<br>        ],<br>        "protocol": "-1",<br>        "to_port": 0<br>      }<br>    ],<br>    "ingress": [<br>      {<br>        "cidr_blocks": [<br>          "0.0.0.0/0"<br>        ],<br>        "description": "Allow HTTPS",<br>        "from_port": 443,<br>        "ipv6_cidr_blocks": null,<br>        "protocol": "tcp",<br>        "to_port": 443<br>      },<br>      {<br>        "cidr_blocks": [<br>          "0.0.0.0/0"<br>        ],<br>        "description": "Allow HTTP",<br>        "from_port": 80,<br>        "ipv6_cidr_blocks": null,<br>        "protocol": "tcp",<br>        "to_port": 80<br>      }<br>    ],<br>    "name": "custom-security-group"<br>  }<br>]</pre> | no |

## Outputs

No outputs.
