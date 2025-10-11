## —— Linter —————————————————————————————————————————————————————————————————————————————————————

# Activate virtual environment
ACTIVATE_VENV = source .venv/bin/activate

# Configuration files
YAMLLINT_CONFIG = .config/.yamllint
FLAKE8_CONFIG = .config/.flake8
ANSIBLE_LINT_CONFIG = .config/.ansible-lint.yml

# Role metadata
ROLE_NAMESPACE := cod3mas0n
ROLE_NAME := users
ROLE_SRC := $(CURDIR)

.PHONY: linter-ansible-lint
linter-ansible-lint: ## Lint Ansible files using ansible-lint
	echo "ansible-lint #########################################################"
	$(ACTIVATE_VENV) && \
	ansible-lint -c $(ANSIBLE_LINT_CONFIG) --force-color --parseable $(ROLE_SRC)

.PHONY: linter-yamllint
linter-yamllint: ## Lint YAML files using yamllint
	echo "yamllint #############################################################"
	$(ACTIVATE_VENV) && \
	yamllint --strict -c $(YAMLLINT_CONFIG) $(ROLE_SRC)

.PHONY: linter-flake8
linter-flake8: ## Lint Python files using flake8
	echo "flake8 ###############################################################"
	$(ACTIVATE_VENV) && \
	flake8 --config $(FLAKE8_CONFIG)

.PHONY: lint
lint: ## Run all linters
	$(MAKE) linter-yamllint
	$(MAKE) linter-ansible-lint
	$(MAKE) linter-flake8
