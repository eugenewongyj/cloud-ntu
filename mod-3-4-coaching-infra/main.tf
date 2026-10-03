locals {
    prefix = "eugene"
}

resource "aws_ecr_repository" "ecr" {
  name         = "${local.prefix}-ecr"
  force_delete = true
}

module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 7.5.0"

  cluster_name = "${local.prefix}-ecs"
  cluster_capacity_providers = ["FARGATE"]

  services = {
    eugene-taskdefinition = { #task definition and service name -> #Change
      cpu    = 512
      memory = 1024
      container_definitions = {
        eugene-container = { #container name -> Change
          essential = true
          image     = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${local.prefix}-ecr:latest"
          port_mappings = [
            {
              containerPort = 8080
              protocol      = "tcp"
            }
          ]
        }
      }
      assign_public_ip                   = true
      deployment_minimum_healthy_percent = 100
      subnet_ids                   = ["subnet-07fe08d5909e677db", "subnet-00b4c98869b996d86"] #List of subnet IDs to use for your tasks
      security_group_ids           = ["sg-0e91952b0f4aef677"] #Create a SG resource and pass it here
    }
  }
}