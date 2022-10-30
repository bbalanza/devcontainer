#!/bin/zsh
ANDROID_SDK_ROOT_PATH=$HOME/.android-sdk

installDependencies() {
    cd $HOME && mkdir tmp && mkdir -p $ANDROID_SDK_ROOT_PATH/cmdline-tools/latest && cd tmp
    curl https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -o sdkmanager.zip
    unzip sdkmanager.zip
    mv ./cmdline-tools/* $ANDROID_SDK_ROOT_PATH/cmdline-tools/latest
    rm -rf $HOME/tmp
}

installAndroidTools() {
    cd $ANDROID_SDK_ROOT_PATH/cmdline-tools/latest/bin
    echo -e 'y\n' | ./sdkmanager --install "platform-tools" 
    echo -e 'y\n' | ./sdkmanager --install "build-tools;30.0.0" 
}

setupEnv() {
    cat <<'EOF' >>~/.zshrc
export PATH=$HOME/.android-sdk/platform-tools/:$PATH
export PATH=$HOME/.android-sdk/cmdline-tools/latest/bin:$PATH
export PATH=$HOME/.android-sdk/platform-tools:$PATH
export PATH=$HOME/.android-sdk/tools/bin:$PATH
export PATH=$HOME/.apktool:$PATH
EOF
}

installSystrace() {
    workdir=$ANDROID_SDK_ROOT_PATH/platform-tools/systrace
    mkdir -p $workdir
    cd $workdir
    curl --output systrace.tar.gz https://android.googlesource.com/platform/prebuilts/fullsdk-linux/platform-tools/+archive/ee73b653fd284875d3730b04e55e3bb95e0b3785/systrace.tar.gz &>/dev/null
    tar -xmzf systrace.tar.gz
    rm systrace.tar.gz
    sudo chown -R vscode:vscode *
    cd $HOME
}

installApktool() {
    cd $HOME
    mkdir .apktool && cd .apktool
    curl --output apktool https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool
    curl --location --output apktool.jar https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.6.1.jar
    sudo chmod +x . -R
}

print "## Installing sdkmanager..."
installDependencies &>/dev/null
print "## Installing android tools..."
installAndroidTools &>/dev/null
print "## Setting up env variables..."
setupEnv &>/dev/null
print "## Installing systrace..."
installSystrace &>/dev/null
print "## Installing apktool..."
installApktool &>/dev/null
