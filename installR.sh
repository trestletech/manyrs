#!/bin/bash

set -e

major=$1
version=$2

dirname=R-$2
if (( $# == 3 )); then
  dirname=$3
fi

url="https://cran.r-project.org/src/base/R-$major/R-$version.tar.gz"

# Download
mkdir -p /tmp/R
cd /tmp/R
wget $url -O "/tmp/R/$version.tar.gz"
tar xzvf "/tmp/R/$version.tar.gz"

cd $dirname

# Compile

mkdir -p /usr/local/lib/R-$version/

./configure --prefix=/usr/local/lib/R-$version --enable-R-shlib --with-blas --with-lapack --with-readline
make --jobs=4
make install

cd ../

rm -rf /tmp/R
