#!/bin/bash

set -o errexit

#################################################################
#                   Install/Upgrade tmux
#################################################################
#
# This script installs or updates tmux onto a Debian (ie Ubuntu),
# CentOS/RHEL, or MacOS platform. This script is based on:
#   - https://github.com/tmux/tmux/wiki/Installing
#
# Can download this script using the github raw link
#   - curl -Lo tmux-install-upgrade.sh <GITHUB RAW URL>
#   - wget -O tmux-install-upgrade.sh <GITHUB RAW URL> 
#
#################################################################
#
# [ IMPORTANT ]: Run with sudo privelages!
#     sudo chmod +x tmux-install-upgrade.sh
#     sudo ./tmux-install-upgrade.sh
#
# Specify tmux version to upgrade
#   - Releases: https://github.com/tmux/tmux/releases
TARGET_VERSION="3.4"
TARGET_DIRECTORY="/usr/local/bin"
#
#################################################################


# Determine the install tool / platform
YUM=false
yum version > /dev/null && YUM=true
APT_GET=false
apt-get -v > /dev/null && APT_GET=true
BREW=false
brew --version > /dev/null && BREW=true


# Determine if tmux is installed
TMUX_INSTALLED=false
tmux -V > /dev/null && TMUX_INSTALLED=true
if [ "$TMUX_INSTALLED" = true ]
then
	CURRENT_VERSION="$(${TARGET_DIRECTORY}/tmux -V)"
else
	CURRENT_VERSION="Not Installed"
fi	


echo "=================================="
echo "Installing/Upgrading tmux ..."
echo "   Target version:   ${TARGET_VERSION}"
echo "   Current version:  ${CURRENT_VERSION}"
echo "   Directory:        ${TARGET_DIRECTORY}"
echo "=================================="
echo

# Check if tmux is already installed and/or on latest version
if [[ "$CURRENT_VERSION" == *"$TARGET_VERSION"* ]]; then
	echo "tmux version '${TARGET_VERSION}' is already installed in directory '${TARGET_DIRECTORY}'"
	exit 0
fi


# Install Compiler and needed libraries
if [ "$YUM" = true ]
then
	# RHEL or CentOS
	echo "RHEL/CentOS: Using 'yum' package manager ..."
	yum update
	yum install -y libevent-devel ncurses-devel gcc make bison pkg-config
	yum clean all
elif [ "$APT_GET" = true ]
then
	# Debian
	echo "DEBIAN: Using 'apt-get' package manager ..."
	apt-get update
	apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config
	apt-get clean
elif [ "$BREW" = true ]
then
	# MacOs
	echo "DEBIAN: Using 'brew' package manager ..."
	brew install -y libevent ncurses
else
	echo "ERROR: Package manager 'yum', 'apt-get', or 'brew' not found"
	exit 1
fi

# Download the specified version
curl -Lo "tmux-${TARGET_VERSION}.tar.gz" "https://github.com/tmux/tmux/releases/download/${TARGET_VERSION}/tmux-${TARGET_VERSION}.tar.gz"

# Unzip the downloaded package
tar -zxf tmux-*.tar.gz

# Get into the unzipped directory
cd tmux-*/
echo "Current directory: $(pwd)"

# Build tmux from source
./configure
make clean
make
make install

# Move the newly build binary into target directory
sudo cp tmux ${TARGET_DIRECTORY}/tmux

# Back out of directory
cd ..
echo "Current directory: $(pwd)"

# Remove the unzipped directory and zip file
echo "Removing all downloaded files and unzipped directories ..."
rm "tmux-${TARGET_VERSION}.tar.gz"
sudo rm -rf "./tmux-${TARGET_VERSION}"

# Show version
echo
echo "Current tmux version: $(${TARGET_DIRECTORY}/tmux -V)"
