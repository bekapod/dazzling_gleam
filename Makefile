.PHONY: explain
explain:
	# ✨ Dazzling Gleam ✨ #
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: format-check
format-check: ## Check formatting
	gleam format --check src test

.PHONY: test-erlang
test-erlang: ## Run tests against Erlang target
	gleam test --target erlang

.PHONY: test-javascript
test-javascript: ## Run tests against JavaScript target
	gleam test --target javascript

.PHONY: test
test: test-erlang test-javascript ## Run tests against all targets

.PHONY: deps
deps: ## Download dependencies
	gleam deps download
