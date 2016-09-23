#!/bin/bash

export CFLAGS="-I${PREFIX}/include"

export LDFLAGS="-L${PREFIX}/lib"
export CPPFLAGS="-I${PREFIX}/include"

export DYLD_FALLBACK_LIBRARY_PATH="${PREFIX}/lib"
export DYLD_LIBRARY_PATH="${PREFIX}/lib"

if [ `uname -m` == ppc64le ]; then
    B="--build=ppc64le-linux"
fi

./configure $B --enable-threadsafe \
            --enable-tempstore \
            --enable-readline \
            --enable-shared=yes \
            --disable-tcl \
            --prefix=$PREFIX
make
make check
make install

rm -rf  $PREFIX/share
