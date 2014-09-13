#!/bin/sh

## git

# run with CHECK.sh
source ./CHECK.sh

CHECK git pull
CHECK ./configure --prefix=/usr/local --with-pager=/usr/bin/lv --with-editor=/usr/local/bin/vim --with-curl 
CHECK make clean
CHECK make -j 4
#su - 
CHECK sudo paco -lD make install
