terraform {
  backend "s3" {
    bucket = "rptoewjrtse"
    key = "terraform.tfstate"
    region = "us-east-2"
    
  }
}
