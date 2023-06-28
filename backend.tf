
terraform {
  backend "s3" {
    bucket = "capstonegithub12"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
