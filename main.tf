terraform {
  required_version = ">= 0.12.26"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

 

provider "aws" {
  access_key = "AKIA6ESCSUTQE7ST3BGV"
  secret_key = "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"
  region     = "us-east-1"
}

 

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-23augbucket22"
  acl    = "private"

 

  versioning {
    enabled = true
  }
}
