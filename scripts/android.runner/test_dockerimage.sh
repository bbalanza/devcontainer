#!/usr/bin/env zsh
test() {
source ~/.zshrc
command -v sdkmanager
command -v adb
command -v monkeyrunner
}
 test &> /dev/null