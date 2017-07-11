#!/bin/bash

# Where do you want to put nc in to
PREFIX=/build/usr/local
# Your libbsd install prefix
BSD_PREFIX=/home/wzy/workspace/app/libbsd/libbsd-0.8.5/build

CC=arm-linux-gcc
make CFLAGS="$CFLAGS -I$BSD_PREFIX/include" LDFLAGS="$LDFLAGS -lbsd -L$BSD_PREFIX/lib -L/usr/local/lib -L/usr/lib"

if [ "$1" == "install" ]; then
  install -Dm0755 nc $PREFIX/bin/nc
  ln -s nc $PREFIX/bin/netcat
  install -Dm0644 nc.1 $PREFIX/share/man/man1/nc.1
fi
