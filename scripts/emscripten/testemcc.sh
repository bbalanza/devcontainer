#!/usr/bin/env zsh
set -ex 
source $HOME/.zshrc
command -v llvm-ar
command -v emsdk
node --version
npm --version
python3 --version
pip3 --version
em++ --version
emcc --version
java -version
cmake --version

exit_code=0

testEmccCompilation() {
echo 'int main() { return 0; }' | emcc -o /tmp/main.js -xc -
node /tmp/main.js || exit_code=$?
if [ $exit_code -ne 0 ]; then
  echo "Node exited with non-zero exit code: $exit_code"
  exit $exit_code
fi
}

testEmbuilder() {
  # test embuilder
  embuilder build zlib --force
}

print "## Testing..."
testEmccCompilation &>/dev/null
testEmbuilder &>/dev/null
