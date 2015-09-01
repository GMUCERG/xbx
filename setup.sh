#! /bin/bash
XBX_WORKDIR=$(pwd)
set -o v
sudo apt-get -y install git gcc make autoconf automake subversion gperf \
    libtool bison flex texinfo gawk libncurses-dev libusb-1.0-0-dev g++ \
    zlib1g-dev libexpat-dev python-dev python3-sqlalchemy sqlitebrowser

# Make working directory and tools and tarballs subdirectory
mkdir -p $XBX_WORKDIR/tools/tarballs

git submodule init
git submodule update --recursive

