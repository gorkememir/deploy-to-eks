terraform {
  backend "s3" {
    bucket         = "demo-tf-backend-gorkem"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}