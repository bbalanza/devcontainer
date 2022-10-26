#!/bin/zsh
print '## Updating repositories...'
sudo apt-get -qq update -y
print '## Installing dependencies...'
sudo apt-get -qq install -y --no-install-recommends \
python3 \
python3-pip \
python3.10-venv \
python2 \
openjdk-8-jre-headless \
unzip \
libxml2-dev \
libxslt-dev &> /dev/null
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py &> /dev/null
sudo python2 get-pip.py &> /dev/null && rm -f get-pip.py
print "## Installing lxml..."
sudo easy_install lxml &> /dev/null