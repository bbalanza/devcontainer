#!/bin/zsh
echo "## Installing dependencies..."
sudo apt-get update 
sudo apt-get install -y --no-install-recommends \
python3 \
python3-pip
