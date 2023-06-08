# terraform {
#  backend "s3" {
#    region = "us-east-1"
#    bucket =  "terrafrom.tfstate2023"
#    key    = "terraform/korede/state.tfstate"
#  }
# }
terraform {
  backend "s3" {
    bucket = "teslim-s3terra"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
