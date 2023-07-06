remote_state {
    backend = "s3"

    config = {
      encrypt    = true
      bucket     = "terraform-state-us-east-1-${get_aws_account_id()}"
      key        = "terraform-project/${path_relative_to_include()}/terraform.tfstate"
      region     = "us-east-1"
      dynamodb_table = "terraform-locks"
    }
}
