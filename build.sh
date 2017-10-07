#!/bin/sh

function fail ()
{
   cd $ROOT_DIR
   exit 1
}

function echo_yellow
{
   # http://misc.flogisoft.com/bash/tip_colors_and_formatting
   echo -e "\e[33m$1\e[0m"
} #/echo_yellow()

ROOT_DIR=$(pwd)

mkdir ./build
cp -r ./src/* ./build || fail
cd ./build || fail
libtoolize || fail
aclocal || fail
autoconf || fail
autoheader || fail
automake --add-missing || fail
./configure || fail
make || fail

echo -e "\nNow run: "
echo_yellow "sudo make -C ./build install\n"