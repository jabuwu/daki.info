terraform {
  backend "s3" {
    bucket  = "jaburu-state-prod"
    key     = "terraform/daki.info.tfstate"
    profile = "jabu"
    region  = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "jabu"
}

locals {
  prefix         = "daki-info"
  domain         = "daki.info"
  alias          = "daki.info"
  regional_alias = "regional.daki.info"
}
