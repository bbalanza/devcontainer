#!/bin/zsh
print "Removing emsdk's node-v14..."
rm -rf $HOME/$EMSDK
print "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
cat <<'EOF' >> $HOME/.zshrc 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOF
source $HOME/.zshrc
print "Installing node 16..."
nvm install 16 && nvm use 16
sed -i 's/NODE_JS.*\n/NODE_JS = node/g'