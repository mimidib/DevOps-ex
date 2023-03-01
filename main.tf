terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.45.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
features {}
}
provider "aws" {
  # Configuration options
}

resource "azurerm_resource_group" "r1" {
  name     = "r1"
  location = "Central Canada"
}

resource "aws_s3_bucket" "b1" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "b1"
    Environment = "Dev"
  }
}
#why is this referencing b1? help
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b1.id
  acl    = "private"
}