#!/bin/bash -e

# setup host ip
#export mockhost=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | grep 10.)
export mockhost=localhost
# setup workarea
export tempwork=$(pwd)
# clean tag file
rm -f done.tag

mvn clean test -Dtest.host=${host} -Dtest.mockhost=${mockhost} -Dtest.tempwork=$tempwork

