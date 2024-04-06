provider aws{
 region = "us-east-1"



}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file ("~/.ssh/id_rsa.pub")
}



resource "aws_s3_bucket" "kaizen_yourname" {
  bucket = "kaizen-eldos"

}

resource "aws_s3_bucket" "kaizen_with_prefix" {
  bucket_prefix = "kaizen-"

}


resource "aws_s3_bucket" "bucket1" {
  bucket = "sdgsg3wswqf" 
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "sdfsfvmyba" 
}


# terraform import aws_s3_bucket.bucket1 sdgsg3wswqf
# terraform import aws_s3_bucket.bucket2 sdfsfvmyba