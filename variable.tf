variable "secret_key" {
    type = string
    default = ""
}
variable "access_key" {
    type = string
    default = ""
}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "public1_cidr" {
    type = string
    default = "10.0.1.0/24"
}

variable "public2_cidr" {
    type = string
    default = "10.0.2.0/24"
}
