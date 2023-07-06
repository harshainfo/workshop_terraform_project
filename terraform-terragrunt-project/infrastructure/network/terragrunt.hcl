include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source = "../../modules/network" # can specify git repo too

  extra_arguments "variables" {
    commands = get_terraform_commands_that_need_vars()
  }
}
  inputs = merge(
    jsondecode(file("${get_terragrunt_dir()}/overrides.tfvars"))
)
