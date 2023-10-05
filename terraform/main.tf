#terraform init
#terraform plan
#terraform apply

variable "region" {
  type = string
  default = "eu-west-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


# Create api gateway 
module "api-gateway" {
  source                       = "../terraform/modules/api-gateway"
  apigw_name                   = "tmnl_apigw"
  lambda_to_invoke             =  module.lambda.lambda_to_invoke
}

module "lambda" {
  source                       = "../terraform/modules/lambda"
  name                         = "replace_words"
}

