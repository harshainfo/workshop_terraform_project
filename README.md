# Terraform-Terragrunt Workshop project
Files for the Cloud Computing Workshop Terraform project

## How to run
1. Install terraform using `brew install terraform`
2. Install terraform using `brew install terragrunt`
3. Install aws cli following the instructions in https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
4. Generate Security Credentials(Access_Key_ID and Secret_Access_Key) for your IAM user using the console
5. Run `aws configure` and provide your Access_Key_ID, Secret_Access_Key, region, and output-format
6. `cd` into `terraform-terragrunt-project/infrastructure/network/`
7. run `terragrunt plan --terragrunt-source-update` and provide `y` to create terraform-state-us-east-1-XXXXX S3 bucket.
8. run `terragrunt apply --terragrunt-source-update` and provide `yes` to create the infrastructure
9. check in the console that the VPC and 2 private and 2 public subnets are created
10. run `terragrunt destroy --terragrunt-source-update` to delete the resources
11. delete `terraform-state-us-east-1-XXXXX` S3 bucket from the console or aws cli
12. delete `terraform-locks` DynamoDB table from the console or aws cli
