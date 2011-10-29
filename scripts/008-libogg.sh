#!/bin/sh
# libogg.sh by Dan Peori (dan.peori@oopo.net)

## Download the source code.
wget --continue --no-check-certificate https://github.com/pspdev/psp-ports/tarball/master -O psp-ports.tar.gz || { exit 1; }

## Unpack the source code.
rm -Rf psp-ports && mkdir psp-ports && tar --strip-components=1 --directory=psp-ports -xzf psp-ports.tar.gz || { exit 1; }

## Enter the source directory.
cd psp-ports/libogg || { exit 1; }

## Bootstrap the source.
LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./autogen.sh --host psp --prefix=$(psp-config --psp-prefix) || { exit 1; }

## Compile and install.
make -j 4 && make install || { exit 1; }
