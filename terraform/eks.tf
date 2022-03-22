data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

module "my-cluster" {
  source           = "terraform-aws-modules/eks/aws"
  cluster_name     = "my-cluster"

  subnet_ids       = module.vpc.private_subnets 
  vpc_id           = module.vpc.vpc_id
}