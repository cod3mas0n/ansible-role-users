## —— Linter —————————————————————————————————————————————————————————————————————————————————————

# Activate virtual environment
ACTIVATE_VENV = source .venv/bin/activate

# Configuration files
YAMLLINT_CONFIG = .config/.yamllint
FLAKE8_CONFIG = .config/.flake8
ANSIBLE_LINT_CONFIG = .config/.ansible-lint

# Role metadata
ROLE_NAMESPACE := cod3mas0n
ROLE_NAME := users_management
ROLE_SRC := $(CURDIR)/users_management
ROLE_PATH := $(CURDIR)/.ansible/roles

.PHONY: prepare-role
prepare-role:
	mkdir -p $(ROLE_PATH)
	ln -sfn $(ROLE_SRC) $(ROLE_PATH)

.PHONY: linter-ansible-lint
linter-ansible-lint: prepare-role ## Lint Ansible files using ansible-lint
	echo "ansible-lint #########################################################"
	$(ACTIVATE_VENV) && \
	ansible-lint --force-color --parseable $(ROLE_PATH)/$(ROLE_NAME)

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
