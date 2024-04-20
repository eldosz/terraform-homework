terraform {
 backend "s3" {
   bucket = "hw6666666"
   key            = "terraform.tfstate"
   region = "us-east-2"
   dynamodb_table = "lock-state"
  
 }
 
 

  

}