provider "aws" {
  region = "us-east-1"
 
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
