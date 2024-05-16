# Cookiecutter Template for Terragrunt

Template supports the following features:

- `direnv` for environment variables management
- `tfenv` for Terraform version management
- `tgenv` for Terragrunt version management
- `sops` for secrets management
- `yaml` based configuration (for better multi-line values support)

## Usage

1. Generate your project from the project template using latest version:

```bash
cookiecutter gh:andreygubarev/cookiecutter-terraform
```

2. Put your SOPS configuration into `.sops.yaml` file. For example:

```yaml
---
creation_rules:
  - pgp:
```

3. Encode your secrets using `sops`:

```bash
find . -name "*.tfvars.sops.yaml" | xargs -I {} sops -e -i {}
```

4. Enable `direnv`:

```bash
direnv allow .
```

5. Put your Terraform backend configuration into `workspaces/<workspace>/terraform.tf` file.

6. Put your Terraform providers into `modules/<module>/providers.tf` file.

7. Initialize your project:

```bash
make workspace
cd workspaces/<workspace>
# tfenv install
terragrunt init
terragrunt apply
```

## Documentation

### Directory Structure

#### Encryption

Git is used as a storage for encrypted secrets. SOPS is used to encrypt/decrypt secrets:

`.sops.yaml` - SOPS configuration file

Note: Git repository must not contain any unencrypted secrets.

#### Environment

Environment variables are primarily used to configure Terraform providers (e.g. AWS credentials).

`.env` - user environment variables

Direnv is used to manage environment variables and automatically load them when changing directories.

`.envrc` - direnv configuration file

#### Versioning

Terraform and Terragrunt versions are managed using `tfenv` and `tgenv` respectively.

`.terraform-version` - Terraform version

`.terragrunt-version` - Terragrunt version

#### Terragrunt Workspaces

Workspaces are used to separate environments (e.g. dev, stage, prod) and instances of the same environment (e.g. dev1, dev2, dev3). Workspaces are stored in `workspaces` directory. Terraform workspaces are not used directly. Instead, separate folders are used for each workspace.

#### Terraform Modules

Terraform modules are stored in `modules` directory. Each module is stored in a separate folder. Module name is used as a folder name. Module folder should follow the structure: https://developer.hashicorp.com/terraform/language/modules/develop/structure

Using modules allows to reuse Terraform code across different workspaces. Every workspace uses single module which is configured in `workspaces/<workspace>/terragrunt.hcl` file in `terraform` block.

#### Terraform Variables

Terraform variables are stored in `workspaces/<workspace>/terraform.tfvars.yaml` file. Each workspace has its own variables file. Variables file is a YAML file. YAML format allows to use multi-line values.

SOPS is used to encrypt/decrypt variables files (`.tfvars.yaml.sops`).

Variables are passed to Terraform module using `input` block in `terragrunt.hcl` file. Terraform module variables are stored in `modules/<module>/variables.tf` file.

#### Terraform Backend

Terraform backend configuration is stored in `workspaces/<workspace>/terraform.tf` file. Each workspace has its own backend configuration file.

## Reference

- Terraform: https://www.terraform.io/
- Terragrunt: https://terragrunt.gruntwork.io/
- tfenv: https://github.com/tfutils/tfenv
- tgenv: https://github.com/cunymatthieu/tgenv
- SOPS: https://github.com/getsops/sops
