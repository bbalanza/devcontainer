#!/bin/zsh
echo "## Installing dependencies..."
sudo apt-get update 
sudo apt-get install -y --no-install-recommends \
build-essential \
default-jre \
python3 \
python3-pip
