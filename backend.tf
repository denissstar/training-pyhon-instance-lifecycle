terraform {
  backend "s3" {
    key            = "training-stop-start-instances/terraform.tfstate"
    region         = "eu-west-1"
    bucket         = "054867543329-tf-states"
    dynamodb_table = "tf-lock-table"
    encrypt        = true
  }
}
