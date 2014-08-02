#!/bin/sh
git pull
./configure --prefix=/usr/local --with-pager=/usr/bin/lv --with-editor=/usr/local/bin/vim --with-curl && 
make clean && 
make -j 4 &&
su - 

