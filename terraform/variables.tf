variable "region" {}
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "subnet_id" {}
variable "vpc_id" {}
variable "rsa_bits" {
  default = 4096
}
variable "private_key_filename" {
  default = "web_app_key.pem"
}
