#!/bin/sh
git pull
./configure --prefix=/usr/local 
make clean 
make -j 4 
su -

