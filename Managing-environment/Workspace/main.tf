terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend

   # terraform terraform workspace new production
   # terraform workspace list
   # terraform workspace select staging

   
#   backend "s3" {
#     bucket         = "devops-directive-tf-state"
#     key            = "07-managing-multiple-environments/workspaces/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-locking"
#     encrypt        = true
#   }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = ""
}

variable "db_pass" {
  description = "password for database"
  type        = string
  sensitive   = true
}

locals {
  environment_name = terraform.workspace
}

module "web_app" {
  source = "../Modules/Web-app-module"

  # Input Variables
  bucket_prefix    = "web-app-data-${local.environment_name}"
  domain           = "devopsdeployed.com"
  environment_name = local.environment_name
  instance_type    = "t2.micro"
  //create_dns_zone  = terraform.workspace == "production" ? true : false  // (if production then create a dns zone)
  db_name          = "${local.environment_name}mydb"
  db_user          = "foo"
  db_pass          = var.db_pass
}