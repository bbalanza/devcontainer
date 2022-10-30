#!/usr/bin/env zsh
installDependencies() {
    sudo apt-get -qq update
    sudo apt-get -qq install -y --no-install-recommends \
    build-essential
}

cleanUp() {
    sudo apt-get clean
    sudo rm -rf /var/lib/apt/lists/*
}
print "## Installing dependencies..."
installDependencies &>/dev/null
cleanUp &>/dev/null