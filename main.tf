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
#Variable Declaration
variable "key_pair_name" {
  type    = string
  default = "demokeypair"
}
#Variable Declaration
variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD3BVBp88VgmeWU0ERBBP0C0wIvC9iaFuvOrwwU01EF13e2wjT7XQ8aIvj3CvvVXvoFK5rbms+i2Ky6F0okAS/M+il2PJgKfSUZuKiLUgr652NTADyBTxmDiMCVg/ytT/oBWxW8EF0Iu8cHkjxr1a+gIxQAZV3AgAsCVhs7gYdT5n28gZncYdCfuUp2+dAe9QvJ6RkBSy/ObaC7WrnXI/ld6BsZNJeLVpOzPjbgbRgmMOXKX87vERdi0vQ64QW7DnE/AjhR4SZ8GWxsty8sJvcuvzX2QOA5TUFtteuFE0rqFjXXCwzuysveXYwHqphs0d6LneHkRDj23ChGKaha8pLvharjq8DUtlVZ3UCBRbsT4/joeM/S71LANkhnatqTsIISP+Sg8MCt21oABvQLAcTV0j/OuDH3h+iPavkm5/Ehjkhkgkg+z/niiEOTAfYfB0X9jqmx9r1a+iOoiPc4NBOVBWxBzq718G6xt1rEXwfmOQol0LI+mVGRBmMLgPGBvniXQv04rQqhQmRvkXHDj8nlXhNoaoXMR0pzvFuxRq/AZnCbaDRRWbEbmUREWLNFB+ZPa0qSMIBH1u8+3p3TxOumnQWw3TxRtSVfTwIPuxjFNyjCe4SyEh90aEK5P/IAPhe9x+O435Z+Es9331Q== preeti@ExampleMachine"
}

 

#Resource to Create Key Pair
resource "aws_key_pair" "demo_key_pair" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}

 

resource "aws_instance" "demo-instance" {
  ami           = "ami-06489866022e12a14"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.demo_key_pair.key_name
}