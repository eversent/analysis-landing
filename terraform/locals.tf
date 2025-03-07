locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = "us-east-1"

  project = "youpost"
  app     = "analysis-app"
  env     = terraform.workspace == "default" ? "dev" : terraform.workspace

  version = {
    dev  = "1.0.0"
    prod = "1.0.0"
  }

  domain = "analysis.youpost.io"
}
