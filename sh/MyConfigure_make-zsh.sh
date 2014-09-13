#!/bin/sh
./configure --prefix=/usr/local --enable-locale --enable-multibyte 
make clean
make -j 4
su -

