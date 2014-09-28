#!/bin/sh

## ag
## (The Silver Searcher)

# run with CHECK.sh
source ./CHECK.sh

CHECK git pull
CHECK ./configure
CHECK make clean
CHECK make -j 4
#su -
CHECK sudo paco -lD make install


