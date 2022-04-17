FROM mcr.microsoft.com/vscode/devcontainers/base:debian-11

ENV USER vscode

# Variables for nodejs
ENV NODE_VERSION 16.14.0
ENV NPM_VERSION 8.7.0
ENV NODE_ROOT "/usr/local/lib/nodejs-${NODE_VERSION}"
ENV NODE_PATH "${NODE_ROOT}/lib/node_modules"
ENV NODE_BIN "${NODE_ROOT}/bin"
ENV PATH "${NODE_BIN}:${PATH}"

# Variables for development tools
ENV PRETTIER_VERSION 2.6.2
ENV PRETTIER_PLUGIN_SH_VERSION 0.10.1
ENV CSPELL_VERSION 5.19.7
ENV SHELLCHECK_VERSION 0.8.0
ENV SECRETLINT_VERSION 5.2.0
ENV COMMITLINT_CLI_VERSION 16.2.3
ENV COMMITLINT_CONFIG_CONVENTIONAL_VERSION 16.2.1
ENV GACP_VERSION 2.10.2
ENV LEFTHOOK_VERSION 0.7.7

# Install and configure
SHELL ["/bin/bash", "-e", "-u", "-o", "pipefail", "-c"]
RUN \
    # -----------------------------------
    # Prepare installation
    # -----------------------------------
    #
    # Ensure apt is in non-interactive to avoid prompts
    export DEBIAN_FRONTEND=noninteractive \
    #
    # Update list of available packages
    && apt-get update \
    #
    # Install packages for common in install instructions
    && apt-get install -y --no-install-recommends \
    coreutils \
    curl \
    tar \
    xz-utils \
    git \
    make \
    # -----------------------------------
    # Install runtime
    # -----------------------------------
    #
    # Install nodejs
    && mkdir -p "${NODE_ROOT}" \
    && curl -fsSL -o - "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz" \
    | tar xJv --strip-components 1 --no-same-owner -C "${NODE_ROOT}" \
    && npm install --global "npm@${NPM_VERSION}" \
    # -----------------------------------
    # Install development tools
    # -----------------------------------
    #
    # Install completion
    && apt-get install -y --no-install-recommends bash-completion \
    #
    # Install formatter
    && npm install --global "prettier@${PRETTIER_VERSION}" "prettier-plugin-sh@${PRETTIER_PLUGIN_SH_VERSION}" \
    #
    # Install spell checker
    && npm install --global "cspell@${CSPELL_VERSION}" \
    #
    # Install shell linter
    && curl -fsSL -o - "https://github.com/koalaman/shellcheck/releases/download/v${SHELLCHECK_VERSION}/shellcheck-v${SHELLCHECK_VERSION}.linux.x86_64.tar.xz" \
	| tar xJv --strip-components 1 --no-same-owner -C /usr/local/bin "shellcheck-v${SHELLCHECK_VERSION}/shellcheck" \
    #
    # Install secret linter
    && npm install --global "secretlint@${SECRETLINT_VERSION}" "@secretlint/secretlint-rule-preset-recommend@${SECRETLINT_VERSION}" \
    #
    # Install conventional commit linter and message generator
    && npm install --global "@commitlint/cli@${COMMITLINT_CLI_VERSION}" "@commitlint/config-conventional@${COMMITLINT_CONFIG_CONVENTIONAL_VERSION}" "gacp@${GACP_VERSION}" \
    #
    # Install git hooks manager
    && npm install --global "@arkweid/lefthook@${LEFTHOOK_VERSION}" \
    # -----------------------------------
    # Configure user permission
    # -----------------------------------
    #
    # Set permission for nodejs
    && groupadd nodejs \
    && gpasswd -a "${USER}" nodejs \
    && chgrp -R nodejs "${NODE_ROOT}" \
    && chmod -R g+rwx "${NODE_ROOT}" \
    # -----------------------------------
    # Clean up
    # -----------------------------------
    #
    # Remove automatically all unused packages
    && apt-get autoremove -y \
    #
    # Erase downloaded archive files
    && apt-get clean -y \
    #
    # Remove package indexes
    && rm -rf /var/lib/apt/lists/*

CMD ["sleep", "infinity"]
