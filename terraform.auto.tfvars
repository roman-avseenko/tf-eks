#------------------ AWS provider variables ------------------#
region = "eu-central-1"

# Resource tag settings to apply across all resources handled by AWS provider
common_tags = {
  Environment = "Dev"
  Project     = "DevOpsLab"
  Owner       = "Roman Avseenko"
  Owner_email = "Raman.Auseyenka@itechart-group.com"
}


#---------------------- VPC variables ----------------------#
vpc_name        = "tf-eks"
cidr            = "192.168.0.0/16"
public_subnets  = ["192.168.0.0/24", "192.168.1.0/24"]
private_subnets = ["192.168.100.0/24", "192.168.101.0/24"]


#---------------------- EKS variables ----------------------#
cluster_name = "tf-eks"

# To see more details about launch template parameters go to
# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
eks_worker_groups_launch_template = [
  {
    name                 = "worker-group-1"
    instance_type        = "t2.micro"
    asg_max_size         = 4
    asg_min_size         = 2
    asg_desired_capacity = 2
  },
  {
    name          = "worker-group-2"
    instance_type = "t2.micro"
    asg_max_size  = 2
  }
]
