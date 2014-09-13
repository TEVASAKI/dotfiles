#!/bin/sh

## libevent

# run with CHECK.sh
source ./CHECK.sh

CHECK ./configure --prefix=/usr/local 
CHECK make clean 
CHECK make -j 4 
#su -
CHECK sudo paco -lD make install

