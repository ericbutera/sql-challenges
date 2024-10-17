.DEFAULT_GOAL := help

.PHONY: help
help: ## Help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# TODO: specific test

.PHONY: build
build: ## build docker image
	docker build -t sqlite-test-runner .

.PHONY: run
run: ## run docker image
	docker run --rm sqlite-test-runner

.PHONY: test
test: ## run all tests
	make build && make run

.PHONY: local-ci
local-ci: ## verify github action works locally
	# https://github.com/nektos/act
	cd .. && act