variable "namespace" {
  type    = string
  default = "monitoring"
}


provider "aws" {
  region = "eu-west-2"

}


#give Helm access to my cluster 
provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.Alt-eks.endpoint
    token                  = data.aws_eks_cluster_auth.Alt-eks.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.Alt-eks.certificate_authority[0].data)
  }
}


provider "kubernetes" {
  host                   = aws_eks_cluster.Alt-eks.endpoint
  token                  = data.aws_eks_cluster_auth.Alt-eks.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.Alt-eks.certificate_authority[0].data)
}




provider "kubectl" {
  load_config_file       = false
  host                   = aws_eks_cluster.Alt-eks.endpoint
  token                  = data.aws_eks_cluster_auth.Alt-eks.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.Alt-eks.certificate_authority[0].data)
}
