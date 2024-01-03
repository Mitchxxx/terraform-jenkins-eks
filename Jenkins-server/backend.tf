terraform {
  backend "s3" {
    bucket = "mitchdev-cicd-terraform-eks"
    key    = "jenkins/terraform.tfstate"
    region = "eu-west-1"
  }
}