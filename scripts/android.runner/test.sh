#!/usr/bin/env zsh
test() {
    print "## Testing installation..."
    source ~/.zshrc
    command -v sdkmanager
    command -v adb
    command -v monkeyrunner
    command -v systrace.py
    command -v python3
    command -v pip3
    command -v python2
    command -v pip2
    command -v java
    command -v apktool
    print "All good!"
}
test
