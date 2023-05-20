resource "aws_s3_bucket" "tf_state_backend" {
  bucket = "tf-state-backend-20052023"
  acl = "private"

  tags = {
    Name = "tf-state-backend"
  }
}

terraform {
  backend "s3" {
    bucket = "tf-state-backend-20052023"
    key = "home/terraform.tfstate"
    region = "eu-west-3"
  }
}