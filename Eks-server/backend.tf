terraform {
  backend "s3" {
    bucket = "mitchdev-cicd-terraform-eks"
    key    = "eks/terraform.tfstate"
    region = "eu-west-1"
  }
}