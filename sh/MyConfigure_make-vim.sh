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
--enable-gui=gtk2 \
# --disable-pythoninterp \
# --enable-python3interp \
# --with-python-config-dir=/usr/lib64/python2.7/config \
# --with-python-config-dir=/usr/lib64/python3.3/config-3.3m/ \
#  --enable-rubyinterp \
# --with-ruby-command=/usr/bin/ruby \
--enable-fontset

CHECK make clean
CHECK make -j 4
#su -
#CHECK sudo paco -lD make install


