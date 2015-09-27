#!/bin/bash

major=$1
version=$2

url="https://cran.r-project.org/src/base/R-$major/R-$version.tar.gz"

# Download
mkdir -p /tmp/R
cd /tmp/R
wget $url -O /tmp/R/$version.tar.gz
tar xzvf /tmp/R/$version.tar.gz

cd R-$version

# Compile

mkdir -p /usr/local/lib/R-$version/

./configure --prefix=/usr/local/lib/R-$version --enable-R-shlib --with-blas --with-lapack --with-readline
make --jobs=4
make install

cd ../

rm -rf /tmp/R
