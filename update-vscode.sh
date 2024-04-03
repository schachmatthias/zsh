#!/bin/bash

# Download the latest version of Visual Studio Code
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb

# Install the downloaded package using dpkg
sudo dpkg -i /tmp/code_latest_amd64.deb

