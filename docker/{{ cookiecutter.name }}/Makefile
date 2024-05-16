### Make ######################################################################
MAKEFILE_DIR := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))

.PHONY: help
help: ## Brief overview of available targets and their descriptions
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

### Docker ####################################################################
DOCKER := DOCKER_BUILDKIT=1 docker
DOCKERFILE := Dockerfile

DOCKER_REGISTRY := {{ cookiecutter.registry }}
DOCKER_IMAGE := $(DOCKER_REGISTRY)/{{ cookiecutter.namespace }}/{{ cookiecutter.name }}
ifneq ($(shell git rev-parse --is-inside-work-tree 2>/dev/null),)
    DOCKER_TAG ?= $(shell git rev-parse --short HEAD)$(shell git diff-index --quiet HEAD -- || echo "-dirty")
else
    DOCKER_TAG := latest
endif

DOCKER_PLATFORM ?= linux/amd64

.PHONY: build
build: ## Build the docker image
	$(DOCKER) build --platform=$(DOCKER_PLATFORM) -f $(DOCKERFILE) -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
