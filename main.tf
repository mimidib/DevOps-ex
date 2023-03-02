terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket-dib-" {
  #creating 3 buckets by incrementing name using count index
  bucket = "${var.bucket-name}-00${count.index}"
  count  = var.number-of-buckets
}

#create 4 users using for_each for naming and toset function to remove duplicates in variable list of names
resource "aws_iam_user" "team-DEV-02" {
  for_each = toset(var.user-names)
  name     = each.value
}

# resource "aws_ec2_instance_state" "imported-guy" {

# }

# resource "aws_ec2_instance_state" "dabbycool" {

# }
