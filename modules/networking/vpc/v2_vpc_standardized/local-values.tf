# Define local values in Terraform

locals {
  owners = var.business_devision
  environment = var.environment
  name = "${var.business_devision}-${var.environment}"
  common_tags = {
    owners = locals.owners
    environment = local.environment
  }
}