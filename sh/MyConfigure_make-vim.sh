#!/bin/sh

## Vim

# run with CHECK.sh
source ./CHECK.sh

CHECK hg pull
CHECK hg update
CHECK ./configure \
--enable-fail-if-missing \
--enable-multibyte \
--with-features=huge \
--disable-selinux \
--prefix=/usr/local \
--srcdir=. \
--enable-gui=gtk2 \
#--enable-pythoninterp \
--with-python-config-dir=/usr/lib/python3.3/ \
--enable-python3interp \
--enable-rubyinterp \
--enable-fontset

CHECK make clean 
CHECK make -j 4 
#su -
#CHECK sudo paco -lD make install


