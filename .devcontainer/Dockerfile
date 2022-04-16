FROM mcr.microsoft.com/vscode/devcontainers/base:debian-11

ENV USER vscode

# Install and configure
SHELL ["/bin/bash", "-e", "-u", "-o", "pipefail", "-c"]
RUN \
    # -----------------------------------
    # Prepare instrallation
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
    # Install development tools
    # -----------------------------------
    #
    # Install completion
    && apt-get install -y --no-install-recommends bash-completion \
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
