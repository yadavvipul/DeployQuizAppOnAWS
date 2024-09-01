# Configure Terraform to use the AWS provider with the specified version
terraform{
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.10.0"
      }
    }
}
 
 # AWS region for the provider
provider "aws" {
  region = "us-east-1"
}