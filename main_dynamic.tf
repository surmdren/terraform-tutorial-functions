provider "aws" {
  region = "ap-northeast-1"
}

data "aws_availability_zones" "available" {}

locals {
  ingress_rules = [{
      port          = 443
      description   = "Port 443"
  },
  {
      port          = 80
      description   = "Port 80"
  }]
}

data "aws_vpc" "main" {
    default = true
}


# Dynamic test
# resource "aws_security_group" "main" {
#     name    = "thus-sg"
#     vpc_id  = data.aws_vpc.main.id

#     dynamic "ingress" {
#         for_each = local.ingress_rules

#         content {
#             description = ingress.value.description
#             from_port   = ingress.value.port
#             to_port     = ingress.value.port
#             protocol    = "tcp"
#             cidr_blocks = ["0.0.0.0/0"]
#         }
#     }
#     /*
#     ingress {
#         description = "Port 443"
#         from_port   = 443
#         to_port     = 443
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     ingress {
#         description = "Port 80"
#         from_port   = 80
#         to_port     = 80
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     */
# }