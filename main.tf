# Require TF version to be same as or greater than 0.12.13
terraform {
  backend "s3" {
   bucket         = "distubucket10"
   key            = "terraform.tfstate"
   region         = "sa-east-1"
   dynamodb_table = "aws-locks"
   encrypt        = true
  }
}

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {
  region = "sa-east-1"
}

# Call the seed_module to build our ADO seed info
module "bootstrap" {
  source               = "./modules/bootstrap"
  name_of_s3_bucket    = "distubucket10"
  dynamo_db_table_name = "aws-locks"
}
