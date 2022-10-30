#!/bin/zsh

removeNode() {
    sed -i 's/NODE\_JS = .*/NODE\_JS = node/g' $EMSDK/.emscripten
    rm -rf $HOME/$EMSDK/updstream/node
}

activateEmsdk() {
    $EMSDK/emsdk activate
    echo 'export PATH="$EMSDK:$PATH"' >>$HOME/.zshrc
    echo 'export PATH="$EMSDK/upstream/emscripten:$PATH"' >>$HOME/.zshrc
}

print "## Removing old node-v14 path..."
removeNode &>/dev/null
print "## Activating emsdk..."
activateEmsdk &>/dev/null
