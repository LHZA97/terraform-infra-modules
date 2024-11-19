variable "aws_region" {
    type    = string
    default = "ap-southeast-5"
}

variable "env" {
    type    = string
    default = "development-provision"
}

variable "repository" {
    type    = string
    default = "https://github.com/LHZA97/terraform-aws-s3.git"
}

variable "created_by" {
    type    = string
    default = "lhza97-admin"
}

variable "app_owner" {
    type    = string
    default = "lhza97-admin"
}