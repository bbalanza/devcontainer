#!/bin/zsh
installDependencies() {
    cd $HOME && mkdir tmp && mkdir -p android-sdk/cmdline-tools/latest && cd tmp
    curl https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -o sdkmanager.zip
    unzip sdkmanager.zip
    mv ./cmdline-tools/* $HOME/android-sdk/cmdline-tools/latest
    rm -rf $HOME/tmp
}

installAndroidTools() {
    cd $HOME/android-sdk/cmdline-tools/latest/bin
    echo -e 'y\n' | ./sdkmanager --install "platform-tools" 
    echo -e 'y\n' | ./sdkmanager --install "build-tools;30.0.0" 
}

setupEnv() {
    cat <<'EOF' >>~/.zshrc
export PATH=$HOME/android-sdk/cmdline-tools/latest/bin:$PATH
export PATH=$HOME/android-sdk/platform-tools:$PATH
export PATH=$HOME/android-sdk/tools/bin:$PATH
EOF
}

print "## Installing sdkmanager..."
installDependencies &>/dev/null
print "## Installing android tools..."
installAndroidTools &>/dev/null
print "## Setting up env variables ..."
setupEnv &>/dev/null
