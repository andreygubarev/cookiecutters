# Cookiecutter template for Ansible Role

Generate your project from the project template using latest version:
```sh
cookiecutter https://github.com/andreygubarev/cookiecutter-ansible-role.git
```

Generate your project from the project template using specific version:
```sh
cookiecutter https://github.com/andreygubarev/cookiecutter-ansible-role.git --checkout v0.1.0
```

Install desired `molecule` driver and its dependencies:
```sh
pip install molecule>=5.0.0,<6.0.0
pip install pytest-testinfra>=8.0.0,<9.0.0
pip install molecule-qemu

pip install ansible>={{ cookiecutter.ansible_version_min }},<{{ cookiecutter.ansible_version_max }}
pip install ansible-lint
```

Create scenario:
```sh
molecule init scenario default --driver-name molecule-qemu --verifier-name testinfra
```

## Environment

Template has `Makefile` with targets for managing environment. To see all available targets run:
```sh
make help
```

Create virtual environment:
```sh
make virtualenv
```

# Reference

- [Cookiecutter](https://cookiecutter.readthedocs.io/en/stable/) - Templating library for creating boilerplate for projects.
