#!/bin/bash -e

if [ -d "tempWorkSpace" ]; then
    rm -rf tempWorkSpace
fi

mkdir tempWorkSpace
cd tempWorkSpace

# setup host ip
export mockhost=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | grep 10.)
# setup workarea
export tempwork=$(pwd)

git clone git@gitsrc-us.ctbg.acer.com:stanley.liang/npt02.git

cd npt02
mvn clean test -Dtest.host=${host} -Dtest.mockhost=${mockhost} -Dtest.tempwork=$tempwork

cd ../
rm -rf tempWorkSpace
