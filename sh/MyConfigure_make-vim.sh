#!/bin/sh
hg pull
hg update
./configure --enable-multibyte --with-features=huge --disable-selinux --prefix=/usr/local --srcdir=. --cache-file=auto --srcdir=. --cache-file=auto/config.cache --enable-gui
make clean 
make -j 4 
su -

