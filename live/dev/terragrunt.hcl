include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/eks"
}

inputs = {
  region       = "us-west-2"
  cluster_name = "dev-eks-cluster"
  subnet_ids   = ["subnet-12345", "subnet-67890"]
}
