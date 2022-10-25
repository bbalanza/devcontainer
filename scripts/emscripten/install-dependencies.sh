#!/bin/zsh
echo "## Installing dependencies..."
sudo apt-get update 
sudo apt-get install -y --no-install-recommends \
default-jre-headless \
python3 \
python3-pip \
llvm 
