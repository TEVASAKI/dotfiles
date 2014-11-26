#!/bin/sh

## zsh

# run with CHECK.sh
source ./CHECK.sh

CHECK git pull
CHECK ./configure --prefix=/usr/local --enable-locale --enable-multibyte
CHECK make clean
CHECK make -j 4
#su -
#CHECK sudo paco -lD make install

