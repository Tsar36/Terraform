terragrunt_version_constraint = ">= v0.36.0"

remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config = {

    bucket         = get_env("TEST_STATE_S3_BUCKET", "")

    key            = "${path_relative_to_include()}/terraform.tfstate"

    region         = get_env("TEST_STATE_REGION", "")

    encrypt        = true

    dynamodb_table = get_env("TEST_STATE_DYNAMODB_TABLE", "")

  }
}

# * The include block finds the root terragrunt.hcl file with using the find_in_parent_folders() built-in function
# in Terragrunt, and automatically inherits all its parameters, including the remote_state configuration. As a result this
# the mysql module will use the same backend settings, same as the root file, and the key field will be automatically
# assigned meaning: data-stores/mysql/terraform.tfstate.