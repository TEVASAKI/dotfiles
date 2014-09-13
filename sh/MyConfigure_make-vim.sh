#!/bin/sh

## Vim

# run with CHECK.sh
source ./CHECK.sh

CHECK hg pull
CHECK hg update
CHECK ./configure --enable-multibyte --with-features=huge --disable-selinux --prefix=/usr/local --srcdir=. --cache-file=auto --srcdir=. --cache-file=auto/config.cache --enable-gui
CHECK make clean 
CHECK make -j 4 
#su -
CHECK sudo paco -lD make install


