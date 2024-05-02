# versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}
# Authirization and Authentication
# Providers
provider "aws" {
  region = "ap-south-1"
  #profile = "default"
}

terraform {
  backend "s3" {
    bucket = "my8ambucket"
    key    = "dev/terraform.state"
    region = "us-east-1"
  }
}

# Webserver - Private Subnet
resource "aws_instance" "cb_jenkins" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-02232a107d70cbbd7"]
  iam_instance_profile   = var.iam_instance_profile
  user_data              = file("jenkins.sh")

  tags = {
    Name      = "cb_jenkins"
    CreatedBy = "Terraform"
  }
}

# Webserver - Private Subnet
resource "aws_instance" "cb_sonarqube" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-02232a107d70cbbd7"]
  iam_instance_profile   = var.iam_instance_profile
  user_data              = file("sonarqube.sh")

  tags = {
    Name      = "cb_sonarqube"
    CreatedBy = "Terraform"
  }
}