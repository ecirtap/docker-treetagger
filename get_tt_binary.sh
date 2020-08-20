#!/bin/sh

source=$1
arch=$2

case $arch in
  linux/amd64) ttarch=linux; ttversion=3.2.3;;
  linux/arm64)  ttarch=ARM64; ttversion=3.2;;
  linux/arm/v7) ttarch=ARM32; ttversion=3.2;;
  *) ttarch=linux; ttversion=3.2.3;;
esac

wget $source/tree-tagger-$ttarch-$ttversion.tar.gz

exit 0
