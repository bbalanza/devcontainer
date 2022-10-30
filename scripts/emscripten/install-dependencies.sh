#!/bin/zsh
installDependencies() {
    sudo apt-get -qq update
    sudo apt-get -qq install -y --no-install-recommends \
        default-jre-headless \
        python3 \
        python3-pip \
        llvm
}
echo "## Installing dependencies..."
installDependencies &>/dev/null