variable "region" {
  default = "eu-west-3"
}

variable "cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "key_name" {
  type    = string
  default = "new-keypair.pem"
}

variable "nat_ami_id" {
  type    = string
  default = "ami-02735309b6cd96b8e"
}
  
