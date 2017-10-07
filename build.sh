#!/bin/sh

function fail ()
{
   cd $ROOT_DIR
   exit 1
}

ROOT_DIR=$(pwd)

cp -r ./src/* ./build || fail
cd ./build || fail
libtoolize || fail
aclocal || fail
autoconf || fail
autoheader || fail
automake --add-missing || fail
./configure || fail
make || fail

printf "\nNow run make install.\n"