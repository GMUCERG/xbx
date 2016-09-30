#! /bin/bash
export XBX_WORKDIR=$(pwd)
export PREFIX=~/.opt/xbx
export PATH=~/.opt/xbx/bin:$PATH

set -v
sudo apt-get -y install git gcc make autoconf automake subversion gperf \
    libtool bison flex texinfo gawk libncurses-dev libusb-1.0-0-dev g++ \
    zlib1g-dev libexpat-dev python-dev python3-sqlalchemy sqlitebrowser

# Make working directory and tools and tarballs subdirectory
mkdir -p $XBX_WORKDIR/tools/tarballs

git submodule init
pushd xbh
git submodule init
popd
pushd xbs_xbd
git submodule init
popd

git submodule update --init --recursive

pushd $XBX_WORKDIR/tools
git clone https://github.com/crosstool-ng/crosstool-ng.git -b crosstool-ng-1.21.0
git clone https://github.com/jhnphm/tiva-c_xtools.git
git clone https://github.com/jhnphm/openocd.git

pushd crosstool-ng
./bootstrap && ./configure --prefix=$PREFIX && make -j && make -j install
popd
pushd tiva-c_xtools
ct-ng build
popd
pushd openocd
./bootstrap && ./configure --prefix=$PREFIX && make -j && make -j install
popd
popd
