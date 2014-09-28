#!/bin/sh

## bdwgc

# run with CHECK.sh
source ./CHECK.sh

CHECK git pull
CHECK ./configure --prefix=/usr/local
CHECK make clean
CHECK make -j 4
#su -
CHECK sudo paco -lD make install

