inputs = merge(
  yamldecode(file("${get_terragrunt_dir()}/terraform.tfvars.yaml")),
  yamldecode(sops_decrypt_file("${get_terragrunt_dir()}/terraform.tfvars.sops.yaml")),
)

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    region         = ""
    dynamodb_table = ""
    bucket         = "terraform/${get_terragrunt_dir()}/terraform.tfstate"
    key            = ""
    encrypt        = true

    skip_bucket_enforced_tls           = false
    skip_bucket_public_access_blocking = false
    skip_bucket_root_access            = false
    skip_bucket_ssencryption           = false
    skip_bucket_versioning             = false
  }
}
