module "vpc" {
  source = "../../modules/vpc"

  project_name = "three-tier"

  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

module "eks" {
  source = "../../modules/eks"

  cluster_name = "three-tier-eks"

  vpc_id = module.vpc.vpc_id

  private_subnets = module.vpc.private_subnets
}

module "ecr" {
  source = "../../modules/ecr"
}

module "jenkins" {
  source = "../../modules/jenkins"

  project_name     = "three-tier"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnets[0]
  cluster_name     = "three-tier-eks"
  region           = var.region
  key_name         = var.jenkins_key_name
}