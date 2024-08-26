# Utiliser un rôle IAM existant pour le cluster EKS
data "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "my-eks-cluster"
  role_arn  = data.aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.public.id, aws_subnet.private.id]
  }
}

# Utiliser un rôle IAM existant pour le groupe de nœuds EKS
data "aws_iam_role" "eks_node_role" {
  name = "eks-node-role"
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_role_arn   = data.aws_iam_role.eks_node_role.arn
  subnet_ids      = [aws_subnet.public.id, aws_subnet.private.id]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.medium"]

  disk_size = 20

  remote_access {
    ec2_ssh_key = "ssh_key_abdel"  # Remplacez par le nom de votre clé SSH
  }

  tags = {
    Name = "eks-node-group"
  }
}
