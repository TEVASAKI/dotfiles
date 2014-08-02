#!/bin/sh
./configure --prefix=/usr/local 
make clean 
make -j 4 
su -

