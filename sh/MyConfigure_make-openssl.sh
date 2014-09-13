#!/bin/sh

## OpenSSL

# run with CHECK.sh
source ./CHECK.sh

CHECK git pull
CHECK ./config --prefix=/usr/local --openssldir=/usr/local/openssl 
CHECK ./Configure linux-x86_64 
CHECK make clean 
CHECK make -j 4 
CHECK make test
#su -
CHECK sudo paco -lD make install
