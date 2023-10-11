
# Load the code coming to the timestamp to the given URL. The same thing happens here
# URL syntax is the same as in source module parameters Terraform. So you can use local
# paths, regular and versioned Git addresses (usingref parameter, as shown in the previous example), etc.

terraform {
  source = "../../../../modules//data-stores/mysql"
}


# The include block finds the root terragrunt.hcl file with using the find_in_parent_folders() built-in function
# in Terragrunt, and automatically inherits all its parameters, including the remote_state configuration. As a result this
# the mysql module will use the same backend settings, same as the root file, and the key field will be automatically
# assigned meaning: data-stores/mysql/terraform.tfstate.
include {
  path = find_in_parent_folders()
}

inputs = {
  db_name = "example_stage"
  db_username = 'admin'

  # Set the username using the TF_VAR_db_username environment variable
  # Set the password using the TF_VAR_db_password environment variable
}


# Run the terraformapply command in the temporary folder, by passing it the input variables that you specified in
# block inputs={...}.