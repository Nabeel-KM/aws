terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# provider "vault" {
#   address = "http://127.0.0.1:8200"
# }

# data "vault_kv_secret_v2" "aws" {
#   mount = "kv"
#   name  = "aws"
# }

# provider "aws" {
#   access_key = data.vault_kv_secret_v2.aws.data["access_key"]
#   secret_key = data.vault_kv_secret_v2.aws.data["secret_key"]
#   region     = var.region
# }


# Configure the AWS Provider
provider "aws" {
  profile = var.profile
  region  = var.region
  //access_key = var.access_key
  //secret_key = var.secret_key

}
