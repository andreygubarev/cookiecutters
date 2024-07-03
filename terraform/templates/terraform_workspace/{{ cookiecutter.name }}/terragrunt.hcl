include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "${path_relative_from_include()}//modules/{{ cookiecutter.name }}/"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = ""
    dynamodb_table = ""
    key            = ""
    region         = ""
    encrypt        = true

    skip_bucket_enforced_tls           = false
    skip_bucket_public_access_blocking = false
    skip_bucket_root_access            = false
    skip_bucket_ssencryption           = false
    skip_bucket_versioning             = false
  }
}
