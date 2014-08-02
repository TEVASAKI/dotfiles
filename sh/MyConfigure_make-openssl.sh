#!/bin/sh
git pull
./config --prefix=/usr/local --openssldir=/usr/local/openssl && 
./Configure linux-x86_64 && 
make clean && 
make -j 4 && 
make test &&
su -

