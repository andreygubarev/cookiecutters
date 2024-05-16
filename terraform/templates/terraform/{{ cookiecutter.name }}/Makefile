.DEFAULT_GOAL := help
.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: format
format:  ## Format Terraform files
	terraform fmt -recursive

.PHONY: install
install:  ## Install Terraform and Terragrunt
	tfenv install
	tgenv install

.PHONY: prerequisities
prerequisities:  ## Install Prerequisities
	brew install direnv sops tfenv tgenv

.PHONY: module
module:  ## Create a new Terraform Module
	cookiecutter gh:andreygubarev/cookiecutter-terraform \
		--directory=templates/terraform_module \
		--output-dir=modules

.PHONY: workspace
workspace:  ## Create a new Terraform Workspace
	cookiecutter gh:andreygubarev/cookiecutter-terraform \
		--directory=templates/terraform_workspace \
		--output-dir=workspaces
