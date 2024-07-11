terraform {
  source = "../modules/eks"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  region            = "us-west-2"
  vpc_cidr_block    = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["us-west-2a", "us-west-2b"]
  cluster_name      = "my-cluster"
  cluster_role_arn  = "arn:aws:iam::123456789012:role/EKSRole"
}
