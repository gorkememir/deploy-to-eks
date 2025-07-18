terraform {
  backend "s3" {
    bucket         = "demo-tf-backend-gorkem"
    key            = "terraform.tfstate"         # You can customize this path if you want
    region         = "us-east-1"                 # Set your bucket's region
    encrypt        = true
  }
}