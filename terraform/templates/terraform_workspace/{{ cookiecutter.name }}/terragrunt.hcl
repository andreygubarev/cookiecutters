remote_state {
    backend = "s3"
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
    config = {
        region         = ""
        dynamodb_table = ""
        bucket         = ""
        key            = ""
        encrypt        = true

        skip_bucket_enforced_tls           = false
        skip_bucket_public_access_blocking = false
        skip_bucket_root_access            = false
        skip_bucket_ssencryption           = false
        skip_bucket_versioning             = false
    }
}

include "root" {
    path = find_in_parent_folders()
}

terraform {
    source = "${path_relative_from_include()}//modules/{{ cookiecutter.name }}/"
}

### Dependencies and Inputs ###################################################

# dependency "" {
#     config_path = ""
# }

inputs = {}
