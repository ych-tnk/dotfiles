#!/bin/bash

set -eu -o pipefail

SCRIPT_DIR="$(
  cd "$(dirname "$0")"
  pwd
)"

install_git() {
  ln --symbolic --force "${SCRIPT_DIR}/git/.gitconfig" ~/.gitconfig
}

install() {
  install_git
}

install
