provider "aws" {
  region = "us-east-1"
  # access_key = "AKIAQEIP3VX3H7KG4UGP"
  #  secret_key =  "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"
}

terraform { 
  cloud { 
    
    organization = "ABDELBAGUI" 

    workspaces { 
      name = "group" 
    } 
  } 
}


provider "kubernetes" {
  host                   = aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks_cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.eks_auth.token
  #load_config_file       = false
}
