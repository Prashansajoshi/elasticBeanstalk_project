terraform {
  backend "s3" {
    bucket         = "8586-terraform-state"
    key            = "prashansa/final_project.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
