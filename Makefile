.SILENT:
.ONSHELL:
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

WORKINGFILES := git ls-files --modified --others | xargs --no-run-if-empty
SHELLFILES := { git grep --untracked --files-with-matches --extended-regexp '^\#!.+sh$$' || true; } | xargs --no-run-if-empty


.PHONY: lint
lint:
	$(WORKINGFILES) npx cspell lint
	$(SHELLFILES) shellcheck

.PHONY: format
format:
	$(WORKINGFILES) npx prettier --write --ignore-unknown --no-error-on-unmatched-pattern
