.ONSHELL:
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

.PHONY: format
format:
	npx prettier --write --no-error-on-unmatched-pattern '**/*.{json,y*ml,sh}'
